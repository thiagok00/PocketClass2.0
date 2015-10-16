//
//  CadastrarAulasVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 15/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class CadastrarAulasVC : UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let horariosArray  = ["7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23"]
    let diasDaSemanaArray = ["Segunda","Terca","Quarta","Quinta","Sexta"]
    var selectedDays = [Int]()
    var tableView:UITableView!
    var horaComeco = 7
    var horaFinal = 8
    let campoSala = UITextField(frame: CGRectMake(18, 0, 320, 50))
    var pickerView:UIPickerView!
    
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Cadastro"
        campoSala.placeholder = "Sala"
        
        tableView = UITableView(frame: CGRectMake(0, 300, self.view.frame.size.width, 400))

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        view.addSubview(tableView)
        
        self.pickerView = UIPickerView(frame: CGRectMake(0, 100, self.view.frame.size.width, 200))
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneButton:")
        
    }
    
    func doneButton(sender:AnyObject) {

        if horaFinal <= horaComeco {
            return errorRegistering("Hora invalida.")
        }
        
        if selectedDays.isEmpty {
            return errorRegistering("Insira pelo menos 1 dia da semana")
        }
        
        let n: Int! = self.navigationController?.viewControllers.count
        let lastVC = self.navigationController?.viewControllers[n-2] as! CadastrarMateriaVC?

        //Testando com aulas da mesma materia não cadastrada ainda
        for aula in (lastVC?.aulasArray)! {
            for dia in selectedDays {
                if dia == aula.dia.rawValue {
                    
                    if (horaComeco < aula.horaComeco && horaFinal > aula.horaComeco) ||
                        (horaComeco > aula.horaComeco && horaComeco < aula.horaFinal) ||
                        horaComeco == aula.horaComeco {
                            return errorRegistering("Hora coincide com outra aula do dia \(dia) dessa mesma materia")
                    }
                
                }
                
            }
        }
        
        //Testando com materias ja existentes
        let materiasArray = DAOMateria().carrega()
        for materia in materiasArray {
            for aula in materia.aulas {
                if (horaComeco < aula.horaComeco && horaFinal > aula.horaComeco) ||
                    (horaComeco > aula.horaComeco && horaComeco < aula.horaFinal) ||
                    horaComeco == aula.horaComeco {
                        return errorRegistering("Horario coincide com aula dia \(aula.dia.rawValue) da materia \(materia.nome)")
                }
                
            }
        }
    
        createLecture()
    
    }
    
    func errorRegistering(errorMessage:String) {
        
        let alerta: UIAlertController = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .Alert)
        let cancelAction: UIAlertAction = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in }
        
        alerta.addAction(cancelAction)
        self.presentViewController(alerta, animated: true, completion: nil)
    
    }
   
    func createLecture() {
    
        let n: Int! = self.navigationController?.viewControllers.count
        let lastVC = self.navigationController?.viewControllers[n-2] as! CadastrarMateriaVC?

        for dia in selectedDays {
            var sala = ""
            if campoSala.text == nil {
                sala = campoSala.text!
            }
            let aula = Aula(dia: Dia.createDay(dia), sala: sala, horaComeco: horaComeco, horaFinal: horaFinal)
            lastVC?.aulasArray.append(aula)
            
        }
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //Picker View Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horariosArray.count-1
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component == 0) {
            return horariosArray[row]
        }
        return horariosArray[row+1]
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            if row > pickerView.selectedRowInComponent(1) {
                pickerView.selectRow(row, inComponent: 1, animated: true)
            }
        }
        else if component == 1 {
            if row < pickerView.selectedRowInComponent(0) {
                pickerView.selectRow(row, inComponent: 0, animated: true)
            }
        }
        atualizaHorario()
    }
    func atualizaHorario () {
        horaComeco = Int(horariosArray[pickerView.selectedRowInComponent(0)])!
        horaFinal = Int(horariosArray[pickerView.selectedRowInComponent(1)+1])!
    
    }
    
    
    //Table View Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "aulacadastro")
        
        if indexPath.row == 0 {
            cell.contentView.addSubview(campoSala)
        }
        if indexPath.row == 1 {
            cell.textLabel?.text = "Dias da Semana"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.detailTextLabel?.text = Dia.getDaysAbbreviations(selectedDays)
        }
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
            let vc = DiasDaSemanaTBVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}//End of Class