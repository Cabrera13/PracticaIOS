//
//  SettingsViewController.swift
//  ProjDef
//
//  Created by Josep Sánchez Serrat on 25/5/17.
//  Copyright © 2017 Josep Sánchez Serrat. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var editTextSurname: UITextField!
    @IBOutlet weak var editTextName: UITextField!
    @IBAction func saveButton(_ sender: Any) {

        let userDefaults = UserDefaults.standard
        
        userDefaults.set(editTextName.text,forKey: "name")
        userDefaults.set(editTextSurname.text,forKey:"surname")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        if let name = userDefaults.value(forKey: "name") as? String? {
            if let currentName = name {
                editTextName.text = currentName
            } else {
                editTextName.text = "No Name"
            }
        }
        
        if let surname = userDefaults.value(forKey: "surname") as? String? {
            if let currentName = surname {
                editTextSurname.text = currentName
            } else {
                editTextSurname.text = "No Name"
            }
        }
    }
}
