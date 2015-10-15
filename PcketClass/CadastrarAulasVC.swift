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
    let diasDaSemanaArray = [NSLocalizedString("Segunda",comment:"") , NSLocalizedString("Terca",comment:"") , NSLocalizedString("Quarta",comment:"") , NSLocalizedString("Quinta",comment:"") , NSLocalizedString("Sexta",comment:"") , NSLocalizedString("Sabado",comment:"")]
    var selectedDays = DiasSelecionados.sharedInstance
    var tableView:UITableView!
    
    override func viewDidLoad() {
        
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Cadastro"
        
        tableView = UITableView(frame: CGRectMake(0, 300, self.view.frame.size.width, 400))

        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        view.addSubview(tableView)
        
        let pickerView = UIPickerView(frame: CGRectMake(0, 100, self.view.frame.size.width, 300))
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addSubview(pickerView)
    }
    
    //Picker View Methods
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2;
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return horariosArray.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return horariosArray[row]
    }
    func pickerView(pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100
    }
    
    //Table View Methods
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "aulacadastro")
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Sala"
        }
        if indexPath.row == 1 {
            cell.textLabel?.text = "Dias da Semana"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
            cell.detailTextLabel?.text = getDaysAbbreviations()
        }
        if indexPath.row == 2 {
            cell.textLabel?.text = "Hora"
        }
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
        print("eu selecionei")
        print(selectedDays.array.count)
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.row == 1 {
            let vc = DiasDaSemanaTBVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func getDaysAbbreviations() ->String {
    
        var str = ""
        let count = selectedDays.array.count
        let abbreviations = ["Seg","Ter","Quar","Qui","Sex","Sab","Dom"]

        if count == 0 {
            return str
        }
        else if count == 1 {
            return self.selectedDays.array[0]
        }
        else if count == 6 {
            return "Todos"
        }
        
        for var i = 0; i < diasDaSemanaArray.count; i++ {
            let dia = diasDaSemanaArray[i]

            if let _ = selectedDays.array.indexOf(dia) {
                str = str + abbreviations[i] + " "
            }
        }
        
        
        return str
    }
    
    
}//End of Class