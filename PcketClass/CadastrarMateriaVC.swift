//
//  CadastrarMateriaVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 11/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class CadastrarMateriaVC: UITableViewController, UITextFieldDelegate {
    
    var aulasArray = [Aula]()
    let campoNome = UITextField(frame: CGRectMake(18, 0, 320, 50))
    let campoCodigo = UITextField(frame: CGRectMake(18, 0, 320, 50))
    let campoTurma = UITextField(frame: CGRectMake(18, 0, 320, 50))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Cadastro"
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        campoCodigo.delegate = self
        campoNome.delegate = self
        campoTurma.delegate = self
        
        campoCodigo.placeholder = "Codigo (opcional)"
        campoNome.placeholder = "Nome*"
        campoTurma.placeholder = "Turma (opcional)"
        
        
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneButton:")
    }
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    func doneButton(sender:AnyObject){

        if campoNome.text == "" {
            return errorRegistering("Por favor insira um nome")
        }
        let materiasArray = DAOMateria().carrega()
        for materia in materiasArray {
            
            if materia.nome == campoNome.text {
                return errorRegistering("Nome ja existente")
            }
            else if materia.codigo == campoCodigo.text && campoCodigo.text != "" {
                return errorRegistering("Codigo ja existente")
            }
        }
        
    }
    
    func errorRegistering(errorMessage:String) {
        
        let alerta: UIAlertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
        
        alerta.addAction(cancelAction)
        self.presentViewController(alerta, animated: true, completion: nil)
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 3) {
            return 1 + aulasArray.count
        }
        return 1
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 3{
            return 30
        }
        else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cadastro")
        
    
        if indexPath.section == 0 {
            cell.contentView.addSubview(campoNome)
        }
        if indexPath.section == 1 {
            cell.contentView.addSubview(campoCodigo)
        }
        if indexPath.section == 2 {
            cell.contentView.addSubview(campoTurma)
        }
        if indexPath.section == 3 {
            if (indexPath.row == 0) {
                cell.textLabel?.text = "Aulas"
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            }
            else {
                let aula = aulasArray[indexPath.row-1]
                cell.textLabel?.text = "\(aula.dia.rawValue): \(aula.horaComeco) - \(aula.horaFinal))"
            }
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 3 && indexPath.row == 0 {
            let vc = CadastrarAulasVC()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }

    
    
}//End of Class