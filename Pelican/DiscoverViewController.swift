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
    let initialLocation = AppData.currentLocation
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
    
    override func viewWillAppear(_ animated: Bool) {
        refreshAnnotations()
    }

    func initializeMap() {
        challengeMap.delegate = self
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(initialLocation.coordinate, initialRegionDiameter, initialRegionDiameter)
        challengeMap.setRegion(coordinateRegion, animated: true)
    }
    
    // MARK: MapViewDelegate
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? ChallengeAnnotation {
            let view: ChallengeAnnotationView
            /*if let dequeuedView = challengeMap.dequeueReusableAnnotationView(withIdentifier: identifier.rawValue) {
                dequeuedView.annotation = annotation
                view = dequeuedView as! ChallengeAnnotationView
            } else {*/
            view = ChallengeAnnotationView(challengeAnnotation: annotation, reuseIdentifier: annotation.challengeType.rawValue, discoverViewController: self)
            return view
        } else if let annotation = annotation as? SoloChallengesAnnotation {
            let identifier = "soloChallenges"
            let view = SoloChallengesAnnotationView(annotation: annotation, reuseIdentifier: identifier, discoverViewController: self)
            return view
        }
        return nil
    }
    
    func refreshAnnotations() {
        challengeMap.removeAnnotations(challengeMap.annotations)
        challengeMap.addAnnotations(AppData.challengeAnnotations)
        challengeMap.addAnnotation(AppData.soloChallengesAnnotation)
    }
    
    // MARK: Actions
    
    @IBAction func notImplemented(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: Constants.featureNotImplementedMessage, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    

}
