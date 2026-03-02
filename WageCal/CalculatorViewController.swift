//
//  ViewController.swift
//  WageCal
//
//  Created by Ramirez Llamas, Stacy on 3/1/26.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlet Inputs
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var hoursTextField: UITextField!
    @IBOutlet weak var statusSwitch: UISwitch!
    
    //IBOutlet Output
    @IBOutlet weak var messageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialization
        messageLabel.isHidden = true
        statusSwitch.isOn = false
    }
    //Calculation Button Function
    @IBAction func calculateButton(_ sender: UIButton) {
        
        messageLabel.isHidden = false
        
        //Input validation
        guard let name = nameTextField.text, !name.isEmpty else {
            messageLabel.text = "Please enter a valid name!"
            return
        }
        guard let hoursText = hoursTextField.text, let hours = Double(hoursText), hours >= 0, hours <= 100 else {
            messageLabel.text = "Please enter a valid number of hours! (0-100)"
            return
        }
    }
    
}

