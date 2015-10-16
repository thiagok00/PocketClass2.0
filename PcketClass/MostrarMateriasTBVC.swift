//
//  MostrarMateriasTBVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 10/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class MostrarMateriasTBVC: UITableViewController {
    
    var materiasArray:[Materia]!
    
    override func viewDidLoad() {
        
        self.title = "Materias"
        materiasArray = DAOMateria().carrega()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addMateria:")
        
    }
    override func viewDidAppear(animated: Bool) {
        materiasArray = DAOMateria().carrega()
        self.tableView.reloadData()
    }
    
    func addMateria(sender:AnyObject) {
        
        let vc = CadastrarMateriaVC()
        self.navigationController?.pushViewController(vc, animated: true)
    
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materiasArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "mat_id")
        
        cell.textLabel?.text = materiasArray[indexPath.row].nome
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vc = MateriaDetalhesVC()
        vc.navigationController?.title = "oioi"
        vc.materiaEscolhida = materiasArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    /* Can Edit Row At Index Path */
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    /* Commit Editing Style */
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            self.materiasArray.removeAtIndex(indexPath.row)
            DAOMateria().salva(materiasArray)
            self.tableView.reloadData()
            
        }
    }
    
    
}//End of Class