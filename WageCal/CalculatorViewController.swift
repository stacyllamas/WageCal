//
//  CalculatorViewController.swift
//  WageCal
//
//  Created by Ramirez Llamas, Stacy on 3/1/26.
//

import UIKit

class CalculatorViewController: UIViewController {
    
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
        //Input validation for name and hours text fields
        guard let name = nameTextField.text, !name.isEmpty else {
            messageLabel.text = "Please enter a valid name!"
            return
        }
        guard let hoursText = hoursTextField.text, let hoursWorked = Double(hoursText), hoursWorked >= 0, hoursWorked <= 100 else {
            messageLabel.text = "Please enter a valid number of hours! (0-100)"
            return
        }
        //let used because the rate is constant (Base Hourly Rate)
        let hourlyRate = 100.00
        //CalculateWage function called with explicit required Parameters list
        let wage = CalculateWage(hoursWorked: hoursWorked,
                                 hourlyRate: hourlyRate,
                                 isAppleCertified: statusSwitch.isOn)
        //Multi-line UILabel display using currency style format
        messageLabel.text = "Thank you, \(name), for using the mobile wage calculator! Your weekly salary is - \(wage.formatted(.currency(code: "USD")))."
        messageLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
    }
    //Custom function that returns final calculated weekly wage - Includes all logic and is called inside the button function
    func CalculateWage(hoursWorked: Double,
                       hourlyRate: Double,
                       isAppleCertified: Bool) -> Double {
        //Creates a mutable copy of the constant hourlyRate parameter
        var hourlyRate = hourlyRate
        //Calculate Apple Certification Bonus (20% increase)
        if isAppleCertified {
            hourlyRate *= 1.20
        }
        //Calculates Overtime hours pay for > 40 hours at 1.5 rate
        if hoursWorked > 40 {
            return (40 * hourlyRate) + ((hoursWorked - 40) * (hourlyRate * 1.50))
        }
        else {
            return hoursWorked * hourlyRate
        }
    }
}

