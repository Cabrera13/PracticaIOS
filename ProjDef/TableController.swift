//
//  TableController.swift
//  ProjDef
//
//  Copyright © 2017 Josep Sánchez Serrat. All rights reserved.
//

import UIKit

class TableController: UIViewController {

    var name: String?
    var numberOfIngredients: Int?
    
    var ingredients = ["CocaCola", "Aigua", "Patates"]
    var ingredientsAdded = Set<String>()
    
    @IBOutlet weak var com: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connexió taula - vc alternativa a connexió per storyboard
        
        com.dataSource = self
        com.delegate = self
        
    }
}

extension TableController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredients.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "t", for: indexPath)
        
        let ingredient = ingredients[indexPath.row]
        cell.textLabel?.text = ingredient
        
        if ingredientsAdded.contains(ingredient) {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
}

extension TableController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Obtenir complement seleccionat
        let ingredient = ingredients[indexPath.row]
        
        // Si el complement no esta seleccionat, afegir-lo
        if ingredientsAdded.contains(ingredient) {
            ingredientsAdded.remove(ingredient)
        } else { // Si esta seleccionat, eliminar-lo
            ingredientsAdded.insert(ingredient)
        }
        
        // Refrescar taula
        com.reloadData()
    }
}

