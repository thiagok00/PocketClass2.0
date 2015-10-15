//
//  Materia.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation



class Materia {
    
    private(set) var nome:String = ""
    private(set) var codigo:String = ""
    private(set) var turma:String = ""
    
    var aulas:[Aula]!
    var tarefas:[Tarefa]!
    
    
    init(nome:String, codigo:String) {
        
        self.nome = nome
        self.codigo = codigo
        self.aulas = [Aula]()
        self.tarefas = [Tarefa]()
    }
    
} //End of Class