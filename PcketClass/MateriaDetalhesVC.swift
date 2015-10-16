//
//  MostrarTarefaTBVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 10/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class MateriaDetalhesVC: UITableViewController, UITextFieldDelegate {
    
    var materiaEscolhida:Materia!
    var isEditingMateria = false
    let campoNome = UITextField(frame: CGRectMake(18, 0, 320, 50))
    let campoCodigo = UITextField(frame: CGRectMake(18, 0, 320, 50))
    let campoTurma = UITextField(frame: CGRectMake(18, 0, 320, 50))
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = materiaEscolhida.nome
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editing:")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
//        self.tableView.userInteractionEnabled = false
        
        self.campoTurma.delegate = self
        self.campoNome.delegate = self
        self.campoCodigo.delegate = self
        
    }
    override func viewDidAppear(animated: Bool) {
        self.tableView.reloadData()
    }
    
    
    func editing(sender:AnyObject) {
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "stopEditing:")
        isEditingMateria = true
        self.tableView.userInteractionEnabled = true
        
        tableView.reloadData()
        
    
    }
    func stopEditing(sender:AnyObject) {
        if salvaAlteracoes() {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editing:")
            isEditingMateria = false
//            self.tableView.userInteractionEnabled = false
            tableView.reloadData()
        }
    
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 3 {
            return materiaEscolhida.aulas.count+1
        }
        return 1
    }
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Nome"
        }
        if section == 1 {
            return "Codigo"
        }
        if section == 2 {
            return "Turma"
        }
        if section == 3 {
            return "Aulas"
        }
        else {
            return "what"
        }
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        if indexPath.section < 2 && !isEditingMateria {
            return nil
        }
        return indexPath
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "detalhe")
        
        
        if indexPath.section == 0 {
            if isEditingMateria {
                cell.contentView.addSubview(campoNome)
                campoNome.text = materiaEscolhida.nome
                campoNome.becomeFirstResponder()
            }
            else {
                cell.textLabel?.text = materiaEscolhida.nome
            }
        }
        else if indexPath.section == 1 {
            
            if isEditingMateria {
                cell.contentView.addSubview(campoCodigo)
                campoCodigo.text = materiaEscolhida.codigo
            }
            else {
                if materiaEscolhida?.codigo == "" {
                cell.textLabel?.text = "(Não informado)"
                cell.textLabel?.textColor = UIColor.darkGrayColor()
                }
            else {
                cell.textLabel?.text = materiaEscolhida.codigo
                }
            }
        }
        else if indexPath.section == 2 {
            if isEditingMateria {
                cell.contentView.addSubview(campoTurma)
                campoTurma.text = materiaEscolhida.turma
            }
            else {
                if materiaEscolhida?.turma == "" {
                    cell.textLabel?.text = "(Não informado)"
                    cell.textLabel?.textColor = UIColor.darkGrayColor()
                }
                else {
                    cell.textLabel?.text = materiaEscolhida.turma
                }
            }
        }
        else if indexPath.section == 3 {
            if indexPath.row == materiaEscolhida.aulas.count {
                cell.textLabel?.text = "Adicionar Aula"
                cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
                cell.textLabel?.textColor = UIColor.redColor()
            }
            else {
                let aula = (materiaEscolhida?.aulas[indexPath.row])!
                cell.textLabel?.text = "\(aula.dia.string): \(aula.horaComeco) - \(aula.horaFinal)"
            }
        }
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 3 && indexPath.row == materiaEscolhida.aulas.count {
            let vc = CadastrarAulasVC()
            self.navigationController?.pushViewController(vc, animated: true)
        
        }
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        if indexPath.section == 3 && indexPath.row != materiaEscolhida.aulas.count{
            return true
        }
        return false
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            self.materiaEscolhida.aulas.removeAtIndex(indexPath.row)
            self.salvaAulas()
            self.tableView.reloadData()
            
        }
    }
    
    func salvaAlteracoes()->Bool {
        
        if campoNome.text == "" {
            return false
        }
        
        materiaEscolhida.nome = campoNome.text!
        materiaEscolhida.codigo = campoCodigo.text!
        materiaEscolhida.turma = campoTurma.text!
        print("AULAS = \(materiaEscolhida.aulas.count)")
        
        let dao = DAOMateria()
        var materiasArray = dao.carrega()
        
        for var i = 0 ; i < materiasArray.count; i++ {
            
            if ObjectIdentifier(materiasArray[i]) == ObjectIdentifier(materiaEscolhida) {
                materiasArray[i] = materiaEscolhida
            }
        }
        dao.salva(materiasArray)
        return true
    }
    func salvaAulas() {
    
        let dao = DAOMateria()
        var materiasArray = dao.carrega()
        
        for var i = 0 ; i < materiasArray.count; i++ {
            
            if ObjectIdentifier(materiasArray[i]) == ObjectIdentifier(materiaEscolhida) {
                materiasArray[i] = materiaEscolhida
            }
        }
        dao.salva(materiasArray)
    }
    

    
    
}//End of Class