//
//  ViewController.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array:[Materia]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // let dao = DAOMateria()
       // array = dao.carrega()
        

        
        

        //print(array.count)
        //self.printaUserInfo()
        
        self.view.backgroundColor = UIColor.yellowColor()

        
        
    }

    func printaUserInfo () {
    
        for materia in array {
        
            print("UMA MATERIA")
            
            print(materia.nome)
            print(materia.codigo)
            for tarefa in materia.tarefas {
                print(tarefa.nome)
                print(tarefa.materiaNome)
                print(tarefa.tipo.rawValue)
                print(tarefa.dataFinal)
                print(tarefa.relevancia)
            }
            for aula in materia.aulas {
                print(aula.sala)
                print(aula.dia.rawValue)
                print(aula.horaComeco)
                print(aula.horaFinal)
            }
            
        
        }
    
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

