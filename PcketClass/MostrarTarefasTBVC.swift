//
//  MostrarTarefaTBVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 10/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class MostrarTarefasTBVC: UITableViewController {
    
    var tarefasArray = [Tarefa]()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Tarefas"
       
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addTarefa:")
        
        
        let materiasArray = DAOMateria().carrega()
        
        for materia in materiasArray {
            for tarefa in materia.tarefas{
                tarefasArray.append(tarefa)
            }
        }
        
    }
    
    func addTarefa(sender:AnyObject) {
    
        let vc = CadastrarTarefaVC()
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefasArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "tarefa_id")

        cell.textLabel?.text = tarefasArray[indexPath.row].nome + " - " + tarefasArray[indexPath.row].materiaNome
        
        
        return cell
    }
    
    
    
    
}