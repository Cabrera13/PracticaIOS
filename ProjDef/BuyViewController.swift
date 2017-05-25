//
//  BuyViewController.swift
//  ProjDef
//
//  Created by Josep Sánchez Serrat on 25/5/17.
//  Copyright © 2017 Josep Sánchez Serrat. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController {

    @IBOutlet weak var ketchup: UISwitch!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var surnameText: UITextField!
    @IBOutlet weak var typeMeatSegment: UISegmentedControl!
    @IBAction func stepperAmount(_ sender: UIStepper) {
        amountLabel.text = String(Int(sender.value))
        
    }
    @IBAction func actionButton(_ sender: UIButton) {
        let userDefaults = UserDefaults.standard
        
        userDefaults.set(nameText.text,forKey: "name")
        userDefaults.set(surnameText.text,forKey:"surname")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard

        if let name = userDefaults.value(forKey: "name") as? String? {
            if let currentName = name {
                nameText.text = currentName
            } else {
                nameText.text = "No Name"
            }
        }
        
        if let surname = userDefaults.value(forKey: "surname") as? String? {
            if let currentName = surname {
                surnameText.text = currentName
            } else {
                surnameText.text = "No Name"
            }
        }
        
        if let name = userDefaults.value(forKey: "name") as? String? {
            if let currentName = name {
                nameText.text = currentName
            } else {
                nameText.text = "No Name"
            }
        }
        
        if let name = userDefaults.value(forKey: "surname") as? String? {
            if let currentName = name {
                surnameText.text = currentName
            } else {
                surnameText.text = "No Name"
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "passToTable" {
            
            if let TableVC = segue.destination as? TableViewController {
                TableVC.contador = amountLabel.text
                
                if ketchup.isOn {TableVC.ketchupV = true}
                else {TableVC.ketchupV = false}
                
                switch typeMeatSegment.selectedSegmentIndex {
                case 0:
                    TableVC.type_chicken = "Chicken"
                case 1:
                    TableVC.type_chicken = "Beef"
                default:
                    break
                }
                

            
            }
        }
    }
}


