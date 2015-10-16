//
//  MostrarTarefaTBVC.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 10/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
import UIKit

class MateriaDetalhesVC: UIViewController {
    
    var materiaEscolhida:Materia?
    var isEditingMateria = false
    
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = materiaEscolhida?.nome
        
        let myLabel = UILabel(frame: CGRectMake(200, 200, 200, 200))
        myLabel.text = materiaEscolhida?.nome
        self.view.addSubview(myLabel)
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editing:")
        
    }
    
    func editing(sender:AnyObject) {
    
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: "stopEditing:")
        isEditingMateria = true
        
    
    }
    func stopEditing(sender:AnyObject) {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "editing:")
        isEditingMateria = false
    
    }

    
    
}