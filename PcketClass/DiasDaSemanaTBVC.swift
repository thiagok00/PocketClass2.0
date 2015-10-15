//
//  DiasDaSemanaTBVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 15/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//


import UIKit

class DiasDaSemanaTBVC: UITableViewController {
    
    
    
    let diasDaSemanaArray = [NSLocalizedString("Segunda",comment:"") , NSLocalizedString("Terca",comment:"") , NSLocalizedString("Quarta",comment:"") , NSLocalizedString("Quinta",comment:"") , NSLocalizedString("Sexta",comment:"") , NSLocalizedString("Sabado",comment:"")]
    let selectedDays = DiasSelecionados.sharedInstance
    
    
    
    /* View Did Load */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.whiteColor()
        title = "Dias da Semana"
        /*******************************************/
        
        //Pega o view anterior (CadastrarMateriasVC)

    }
    
    /* Number of Sections In Table View */
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /* Number of Rows In Section */
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return diasDaSemanaArray.count
    }
    
    /* Cell for Row At Index Path */
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "dias")
        
        cell.textLabel?.text = diasDaSemanaArray[indexPath.row]
        

        
        if let _ = selectedDays.array.indexOf(diasDaSemanaArray[indexPath.row]) {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
        return cell
    }
    
    /* Did Select Row At Index Path */
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let cellcheck = tableView.cellForRowAtIndexPath(indexPath)
        
        /* Desmarca uma celula já selecionada */
        if (cellcheck!.accessoryType == .None) {
            cellcheck!.accessoryType = .Checkmark
            selectedDays.array.append(diasDaSemanaArray[indexPath.row])
        }
            /*  Marca uma celula ainda não selecionada   */
        else {
            cellcheck!.accessoryType = .None
            if let index = selectedDays.array.indexOf(diasDaSemanaArray[indexPath.row]) {
               selectedDays.array.removeAtIndex(index)
            }
        }
    }
    
    
} //End of Class