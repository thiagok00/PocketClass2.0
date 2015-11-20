//
//  DiasDaSemanaTBVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 15/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//


import UIKit

class DiasDaSemanaTBVC: UITableViewController {
    
    
    
    var diasDaSemanaArray = [1,2,3,4,5,6,7]
    
    /* View Did Load */
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.whiteColor()
        title = "Dias da Semana"
        tableView.tableFooterView = UIView(frame:CGRectZero)
        self.tableView.scrollEnabled = false
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
        
        cell.textLabel?.text = Dia.returnString(indexPath.row+1)
        
        let n: Int! = self.navigationController?.viewControllers.count
        let lastVC = self.navigationController?.viewControllers[n-2] as! CadastrarAulasVC?
        
        if let _ = lastVC!.selectedDays.indexOf(diasDaSemanaArray[indexPath.row]) {
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
        
        let n: Int! = self.navigationController?.viewControllers.count
        let lastVC = self.navigationController?.viewControllers[n-2] as! CadastrarAulasVC?
        
        /* Desmarca uma celula já selecionada */
        if (cellcheck!.accessoryType == .None) {
            cellcheck!.accessoryType = .Checkmark
            lastVC!.selectedDays.append(diasDaSemanaArray[indexPath.row])
        }
            /*  Marca uma celula ainda não selecionada   */
        else {
            cellcheck!.accessoryType = .None
            if let index = lastVC!.selectedDays.indexOf(diasDaSemanaArray[indexPath.row]) {
               lastVC!.selectedDays.removeAtIndex(index)
            }
        }
    }
    
    
} //End of Class