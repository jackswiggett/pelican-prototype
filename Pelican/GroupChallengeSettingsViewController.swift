//
//  GroupChallengeSettingsViewController.swift
//  Pelican
//
//  Created by Jack Swiggett on 12/9/16.
//  Copyright © 2016 Pelitech. All rights reserved.
//

import UIKit
class GroupChallengeSettingsViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var srvc: SWRevealViewController?
    @IBOutlet weak var publicPrivateControl: UISegmentedControl!
    var challenge: GroupChallenge?
    @IBOutlet weak var challengeName: UILabel!
    @IBOutlet weak var minPicker: UIPickerView!
    @IBOutlet weak var maxPicker: UIPickerView!
    @IBOutlet weak var nextButton: UIButton!
    
    let minParticipants = 2
    let maxParticipants = 10
    
    var minPickerRange = [2, 10]
    var maxPickerRange = [2, 10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        challengeName.text = challenge!.name
        
        nextButton?.layer.cornerRadius = Constants.buttonCornerRadius
        nextButton?.clipsToBounds = true

        publicPrivateControl.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 18)], for: .normal)
        
        self.minPicker.delegate = self
        self.maxPicker.delegate = self
        self.maxPicker.selectRow(maxPickerRange[1]-maxPickerRange[0], inComponent: 0, animated: false)
    }
    
    // MARK: UIPickerView
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch (pickerView) {
        case minPicker:
            return minPickerRange[1] - minPickerRange[0] + 1
        case maxPicker:
            return maxPickerRange[1] - maxPickerRange[0] + 1
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch (pickerView) {
        case minPicker:
            return String(minPickerRange[0] + row)
        case maxPicker:
            return String(maxPickerRange[0] + row)
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let minValue = minPickerRange[0] + minPicker.selectedRow(inComponent: 0)
        let maxValue = maxPickerRange[0] + maxPicker.selectedRow(inComponent: 0)
        
        switch (pickerView) {
        case minPicker:
            maxPickerRange[0] = minValue
            maxPicker.reloadComponent(0)
            maxPicker.selectRow(maxValue - minValue, inComponent: 0, animated: false)
        case maxPicker:
            minPickerRange[1] = maxValue
            minPicker.reloadComponent(0)
        default:
            return
        }
    }
    
    // MARK: Navigation
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dateVC = segue.destination as? GroupChallengeDateViewController {
            dateVC.challenge = challenge
            dateVC.srvc = srvc
        }
    }

}
