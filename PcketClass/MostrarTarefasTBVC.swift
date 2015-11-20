//
//  MostrarTarefaTBVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 10/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class MostrarTarefasTBVC: UITableViewController, UIAlertViewDelegate {
    
    var tarefasArray = [Tarefa]()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Tarefas"
       
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.allowsSelection = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addTarefa:")
    }
    override func viewDidAppear(animated: Bool) {
        self.reloadTarefasArray()
        self.tableView.reloadData()
    }
    
    func reloadTarefasArray() {
        let materiasArray = DAOMateria().carrega()
        var array = [Tarefa]()
        for materia in materiasArray {
            for tarefa in materia.tarefas{
                array.append(tarefa)
            }
        }
        tarefasArray = array
    }
    func addTarefa(sender:AnyObject) {
    
        if DAOMateria().carrega().count == 0 {
            let alert = UIAlertController(title: "Opa", message: "Você só pode cadastrar tarefas se tiver materias cadastradas", preferredStyle: UIAlertControllerStyle.Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alert.addAction(defaultAction)
            presentViewController(alert, animated: true, completion: nil)
        }
        else {
            let vc = CadastrarTarefaVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tarefasArray.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "tarefa_id")

        let tarefa = tarefasArray[indexPath.row]
        cell.textLabel?.text = tarefa.nome + " - " + tarefa.materiaNome
        cell.detailTextLabel?.text = tarefa.getStringTempoRestante()
        cell.imageView?.image = TipoTarefa.getImg(tarefa.tipo)
        
        return cell
    }
    
    /* Can Edit Row At Index Path */
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    /* Commit Editing Style */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            DAOMateria().removeTarefa(tarefasArray[indexPath.row])
            self.reloadTarefasArray()
            tableView.reloadData()
        }
    }
    

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DetalheTarefasVC()
        vc.tarefaEscolhida = tarefasArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}