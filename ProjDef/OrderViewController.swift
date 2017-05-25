//
//  OrderViewController.swift
//  ProjDef
//
//  Created by Josep Sánchez Serrat on 25/5/17.
//  Copyright © 2017 Josep Sánchez Serrat. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController {

    var contador: String?
    var type_chicken: String?
    var ketchupV : Bool?
    var ingredientsAdded = Set<String>()
    
    @IBOutlet weak var dataOrder: UILabel!
    @IBOutlet weak var surname: UILabel!
    @IBOutlet weak var chicken: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var withOrWithoutKetchup: UILabel!
    
    @IBOutlet weak var labelStepper: UILabel!
    @IBAction func buttonOrder(_ sender: UIButton) {
         self.performSegue(withIdentifier: "goHome", sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = UserDefaults.standard
        if let name = userDefaults.value(forKey: "name") as? String? {
            if let currentName = name {
                nameLabel.text = currentName
            } else {
                nameLabel.text = "No Name"
            }
        }
        
        if let name = userDefaults.value(forKey: "surname") as? String? {
            if let currentName = name {
                surname.text = currentName
            } else {
                surname.text = "No Name"
            }
        }
        if ketchupV! { withOrWithoutKetchup.text = "With ketchup"  }
        else {
            withOrWithoutKetchup.text = "Without ketchup"
        }
        labelStepper.text = contador
        chicken.text = type_chicken
        dataOrder.text = ingredientsAdded.joined(separator: " , ")

    }

    
}
