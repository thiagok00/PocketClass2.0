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
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.title = materiaEscolhida?.nome
        
        let myLabel = UILabel(frame: CGRectMake(200, 200, 200, 200))
        myLabel.text = materiaEscolhida?.nome
        self.view.addSubview(myLabel)
    
    
    }
    
    
    
    
}