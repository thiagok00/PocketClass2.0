//
//  Materia.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation



class Materia {
    
    var nome:String = ""
    var codigo:String = ""
    var turma:String = ""
    
    var aulas:[Aula]!
    var tarefas:[Tarefa]!
    
    
    init(nome:String) {
        
        self.nome = nome
        self.aulas = [Aula]()
        self.tarefas = [Tarefa]()
    }
    
} //End of Class