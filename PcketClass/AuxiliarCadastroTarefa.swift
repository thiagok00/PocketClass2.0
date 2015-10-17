//
//  AuxiliarCadastroTarefa.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 17/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class AuxiliarCadastroTarefa: UITableViewController {
    
    var mostrarMateria = false
    var materiasArray:[Materia]?
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.whiteColor()
        if mostrarMateria {
            materiasArray = DAOMateria().carrega()
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mostrarMateria {
            return (materiasArray?.count)!
        }
        else {
            return 5
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "id")
        
        if mostrarMateria {
            cell.textLabel?.text = materiasArray![indexPath.row].nome
        
        }
        else {
            cell.textLabel?.text = TipoTarefa.returnString(indexPath.row)
        }
        
        return cell
    }
    
    
    
}//End of Class