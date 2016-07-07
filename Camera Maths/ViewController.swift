//
//  ViewController.swift
//  Camera Maths
//
//  Created by Jan on 07.07.16.
//  Copyright © 2016 dfragment.net. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    @IBOutlet weak var cropFactorControl: UISegmentedControl!
    @IBOutlet weak var focalLengthLabel: UILabel!
    @IBOutlet weak var focalLengthSlider: UISlider!
    
    @IBOutlet weak var fullFormatSizeLabel: UILabel!
    @IBOutlet weak var maxExposureTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateResults()
    }

    @IBAction func focalLengthChanged(sender: UISlider) {
        let rounded = floor(sender.value) // runden, ist schöner
        sender.setValue(rounded, animated: false) // Setzen, aber nicht animieren
        focalLengthLabel.text = "\(Int(sender.value))"
        updateResults()
    }
    
    @IBAction func cropFactorChanged(sender: UISegmentedControl) {
        updateResults()
    }
    
    func updateResults() {
        let cropped = Logic.cropResult(currentCropFactor, focalLength: currentFocalLength)
        let maxStable = Logic.maxStableImage(currentCropFactor, focalLength: currentFocalLength)
        let maxStableInverted = Int(1 / maxStable)
        
        fullFormatSizeLabel.text = "\(cropped)"
        maxExposureTimeLabel.text = "\(maxStable) (1/\(maxStableInverted))"
    }
    
    var currentCropFactor : Float {
        switch cropFactorControl.selectedSegmentIndex {
            case 0: return 1.0
            case 1: return 1.5
            case 2: return 1.6
            default: return 1.0
        }
    }
    
    var currentFocalLength : Int {
        return Int(focalLengthSlider.value)
    }
}

