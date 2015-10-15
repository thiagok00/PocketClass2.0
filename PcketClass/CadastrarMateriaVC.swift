//
//  CadastrarMateriaVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 11/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class CadastrarMateriaVC: UITableViewController {
    
    let aulasArray = [Aula]()
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = "Cadastro"
    
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "doneButton:")
    }
    func doneButton(sender:AnyObject){
        print("NOT IMPLEMENTED")
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
            cell.textLabel?.text = "Nome"
        }
        if indexPath.section == 1 {
            cell.textLabel?.text = "Codigo"
        }
        if indexPath.section == 2 {
            cell.textLabel?.text = "Turma"
        }
        if indexPath.section == 3 {
            cell.textLabel?.text = "Aulas"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
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