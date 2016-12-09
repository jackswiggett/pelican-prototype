//
//  DiscoverViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/1/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import MapKit

class DiscoverViewController: UIViewController, MKMapViewDelegate {

    // MARK: Properties
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var challengeMap: MKMapView!
    let initialLocation = CLLocation(latitude: 37.426264, longitude: -122.171746)
    let initialRegionDiameter : Double = 1400 // meters
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure menu button to show navigation menu
        if let revealViewController = self.revealViewController() {
            menuButton.target = revealViewController
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            revealViewController.rearViewRevealWidth = 200
        }
        
        initializeMap()
    }

    func initializeMap() {
        challengeMap.delegate = self
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, initialRegionDiameter, initialRegionDiameter)
        challengeMap.setRegion(coordinateRegion, animated: true)
        challengeMap.addAnnotations(AppData.challengeAnnotations)
    }
    
    // MARK: MapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? ChallengeAnnotation {
            let identifier = annotation.challengeType
            let view: ChallengeAnnotationView
            if let dequeuedView = challengeMap.dequeueReusableAnnotationView(withIdentifier: identifier.rawValue) {
                dequeuedView.annotation = annotation
                view = dequeuedView as! ChallengeAnnotationView
            } else {
                view = ChallengeAnnotationView(challengeAnnotation: annotation, reuseIdentifier: annotation.challengeType.rawValue)
            }
            return view
        }
        return nil
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
