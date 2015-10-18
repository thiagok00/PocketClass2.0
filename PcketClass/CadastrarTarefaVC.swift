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
    var materiasArray = DAOMateria().carrega()
    var materiaSelecionada:Int = -1
    var tipoSelecionado = -1
    var datePicker:UIDatePicker!
    
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
        
        self.datePicker = UIDatePicker(frame: CGRectMake(0, 100, self.view.frame.size.width, 200))
        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.minimumDate = NSDate()
        datePicker.maximumDate = NSDate().dateByAddingTimeInterval(365*24*60*60)
        view.addSubview(datePicker)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "cadastrarTarefa:")
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "popYourself:", name: "popCadastroTarefa", object: nil)
        
        
    }
    override func viewDidAppear(animated: Bool) {
        DAOMateria().carrega()
        self.tableView.reloadData()
    }
    
    func cadastrarTarefa(sender:AnyObject) {
        
        if campoNome.text == "" {
            return errorRegistering("Por favor insira um nome")
        }
        if materiaSelecionada == -1 {
            return errorRegistering("Por favor escolha uma materia")
        }
        if tipoSelecionado == -1 {
            return errorRegistering("Por favor escolha um tipo para a tarefa")
        }

        let tarefa = Tarefa(nome: campoNome.text!, dataFinal: datePicker.date, tipo: tipoSelecionado, materiaNome: materiasArray[materiaSelecionada].nome, relevancia: 0)
        materiasArray[materiaSelecionada].tarefas.append(tarefa)
        DAOMateria().salva(materiasArray)
        
        navigationController?.popViewControllerAnimated(true)
    }
    func errorRegistering(errorMessage:String) {
        
        let alerta: UIAlertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
        
        alerta.addAction(cancelAction)
        self.presentViewController(alerta, animated: true, completion: nil)
        
    }
    
    
    //table view methods
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cad_tarefa")
        
        if indexPath.row == 0 {
            cell.contentView.addSubview(campoNome)
        }
        else if indexPath.row == 1 {
            cell.textLabel?.text = "Materia"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            if (materiaSelecionada >= 0 && materiaSelecionada < materiasArray.count) {
                cell.detailTextLabel?.text = materiasArray[materiaSelecionada].nome
            }
        }
        else if indexPath.row == 2 {
            cell.textLabel?.text = "Tipo da tarefa"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            if tipoSelecionado != -1 {
                cell.detailTextLabel?.text = TipoTarefa.returnString(tipoSelecionado)
            }
        }

        
        return cell
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        
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
        
        return nil
    }
    func popYourself(sender:AnyObject){
        self.navigationController?.popToRootViewControllerAnimated(false)
    }
}