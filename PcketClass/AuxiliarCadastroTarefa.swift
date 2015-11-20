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
    var materiasArray:[Materia] = DAOMateria().carrega()
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.whiteColor()
        tableView.tableFooterView = UIView(frame: CGRect.zero)

        if mostrarMateria {
            materiasArray = DAOMateria().carrega()
        }
        else {
            tableView.scrollEnabled = false
        }
        
    }
    override func viewDidAppear(animated: Bool) {
        materiasArray = DAOMateria().carrega()
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mostrarMateria {
            return (materiasArray.count)
        }
        else {
            return 5
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "id")
        let n: Int! = self.navigationController?.viewControllers.count
        let lastVC = self.navigationController?.viewControllers[n-2] as! CadastrarTarefaVC?

        cell.accessoryType = UITableViewCellAccessoryType.None
        
        if mostrarMateria {
            cell.textLabel?.text = materiasArray[indexPath.row].nome
           
            if lastVC?.materiaSelecionada == indexPath.row {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
        
        }
        else {
            cell.textLabel?.text = TipoTarefa.returnString(indexPath.row)
            if lastVC?.tipoSelecionado == indexPath.row {
                cell.accessoryType = UITableViewCellAccessoryType.Checkmark
            }
            
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cellcheck = tableView.cellForRowAtIndexPath(indexPath)
        
        let n: Int! = self.navigationController?.viewControllers.count
        let lastVC = self.navigationController?.viewControllers[n-2] as! CadastrarTarefaVC?
        
        if (cellcheck!.accessoryType == .None) {
            if mostrarMateria {
                lastVC?.materiaSelecionada = indexPath.row
            }
            else {
                lastVC?.tipoSelecionado = indexPath.row
            }
            
        }
        else {
            cellcheck!.accessoryType = .None
            if mostrarMateria {
                lastVC?.materiaSelecionada = -1
            }
            else {
                lastVC?.tipoSelecionado = -1
            }
        }
        self.tableView.reloadData()
    }
    
    
    
}//End of Class