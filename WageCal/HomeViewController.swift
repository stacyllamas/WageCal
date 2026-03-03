//
//  HomeViewController.swift
//  WageCal
//
//  Created by Ramirez Llamas, Stacy on 3/2/26.
//
// This HomeViewController includes my additional features to the basic WageCal App


import UIKit
//Enhancement 1: An additional "Home" tab (aside from the calculator tab) that welcomes users by adding the tab bar controller object
//This provides a multi-tab experience and additional information about the app's purpose.
class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoLabel.isHidden = true
        welcomeLabel.text = "Welcome to WageCal: the Wage Calculator App!"
        welcomeLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
    }
   //Enhancement 2: A UIButton IBAction that displays an information label when pressed
    //The infoLabel is initially hidden until the button is pressed, subsequently revealing a message about the app's purpose/abilities.
    @IBAction func infoButton(_ sender: UIButton) {
        infoLabel.isHidden = false
        infoLabel.text = "This app will help you calculate your weekly earnings as an IT consultant, based on your hourly wage and the number of hours you work at the firm each week. Your hourly wage is determined by the number of regular and / or overtime hours you work, as well as your Apple certification status."
        infoLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    }
}
