//
//  MostrarHorarioVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 10/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class MostrarHorarioVC: UITableViewController {
    
    var aulasArray:[Aula]!
    var materiaDaAula:[Materia]!
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Horario"
        self.atualizaAulasArray()
        self.tableView.allowsSelection = false
        
        print(NSDate.getHour()!)
        
        aulasArray.count
    }
    func atualizaAulasArray() {
        
        aulasArray = [Aula]()
        materiaDaAula = [Materia]()
        
        let materiasArray = DAOMateria().carrega()
        let day = NSDate.getDayOfWeek()
        
        for materia in materiasArray {
            for aula in materia.aulas {
                if aula.dia.rawValue == day {
                    aulasArray.append(aula)
                    materiaDaAula.append(materia)
                }
            }
        }
        //aulasArray.sortInPlace(({$0.horaComeco < $1.horaComeco}))
    }
    override func viewDidAppear(animated: Bool) {
        atualizaAulasArray()
        tableView.reloadData()
        let hour = NSDate.getHour()
        if (hour >= 7 && hour <= 21){
            self.tableView.allowsSelection = true
            tableView.selectRowAtIndexPath(NSIndexPath(forRow: hour!-7, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.Bottom)
            self.tableView.allowsSelection = false

        }
    }
    




    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "horario")
        
        let formatter = NSNumberFormatter()
        formatter.minimumIntegerDigits = 2

        let horaComeco = indexPath.row+7
        let horaFinal = indexPath.row+8
        
        var string = formatter.stringFromNumber(horaComeco)!+":00 - "+formatter.stringFromNumber(horaFinal)!+":00     "

        
        for var i = 0 ; i < aulasArray.count ; i++ {
            let aula = aulasArray[i]
            if aula.horaComeco <= horaComeco && aula.horaFinal > horaComeco {
                string = string + materiaDaAula[i].nome
                cell.detailTextLabel?.text = "                   "+aula.sala
            }
        
        }
        
        cell.textLabel?.text = string
        
        return cell
    }
    
    
}