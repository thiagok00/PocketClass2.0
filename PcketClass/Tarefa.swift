//
//  Tarefa.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation

enum tfTipo:String {
    case Trabalho = "Trabalho"
    case Prova = "Prova"
    case Apresentacao = "Apresentacao"
    case Teste = "Teste"
    case Lista = "Lista"
}


class Tarefa {
    
    var nome:String = ""
    var dataFinal:NSDate = NSDate()
    var tipo:tfTipo!
    let materiaNome:String!
    var relevancia:Float = 0.0
    
    
    init (nome:String, dataFinal:NSDate, tipo:tfTipo, materiaNome:String, relevancia:Float){
    
        self.nome = nome
        self.dataFinal = dataFinal
        self.tipo = tipo
        self.materiaNome = materiaNome
        self.relevancia = relevancia
    }
    
}