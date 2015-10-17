//
//  CadastrarTarefaVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 11/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class CadastrarTarefaVC: UIViewController,UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    let campoNome = UITextField(frame: CGRectMake(18, 0, 320, 50))
    var tableView:UITableView!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Cadastrar Tarefa"
        campoNome.delegate = self
        campoNome.placeholder = "Nome"
        
        tableView = UITableView(frame: CGRectMake(0, 300, self.view.frame.size.width, 400))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame:CGRectZero)
        view.addSubview(tableView)
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cad_tarefa")
        
        if indexPath.row == 0 {
            cell.contentView.addSubview(campoNome)
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = "Materia"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = "Tipo da tarefa"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }

        
        return cell
    }
    
     func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            campoNome.becomeFirstResponder()
        }
        else if indexPath.row == 1 {
            let vc = AuxiliarCadastroTarefa()
            vc.mostrarMateria = true
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if indexPath.row == 2 {
            let vc = AuxiliarCadastroTarefa()
            vc.mostrarMateria = false
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        
        
    }
    
    
    
}