//
//  DetalheTarefasVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 20/11/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit


class DetalheTarefasVC: UITableViewController {
    
    var tarefaEscolhida:Tarefa!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = tarefaEscolhida.nome
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.scrollEnabled = false
        
        let button = UIButton(frame: CGRectMake(0,0,200,40))
        button.layer.cornerRadius = 10
        button.center.x = self.view.center.x
        button.center.y = 400
        button.backgroundColor = UIColor.redColor()
        button.setTitle("Excluir Tarefa", forState: UIControlState.Normal)
        button.addTarget(self, action: "deletarTarefa", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    func deletarTarefa() {
        DAOMateria().removeTarefa(tarefaEscolhida)
        self.navigationController?.popToRootViewControllerAnimated(true)
    
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "detalhe-tarefa")

        if indexPath.section == 0 {
            cell.textLabel?.text = tarefaEscolhida.nome
        }
        else if indexPath.section == 1 {
            cell.textLabel?.text = tarefaEscolhida.materiaNome
        }
        else if indexPath.section == 2 {
            cell.textLabel?.text = tarefaEscolhida.tipo.string
        }
        else {
            cell.textLabel?.text = tarefaEscolhida.dataFinal.getCurrentShortDate() + " - " + tarefaEscolhida.getStringTempoRestante()
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Nome"
        }
        else if section == 1 {
            return "Materia"
        }
        else if section == 2 {
            return "Tipo"
        }
        else {
            return "Data"
        }
    }
    
} //End of Class