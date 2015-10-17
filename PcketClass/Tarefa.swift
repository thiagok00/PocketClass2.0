//
//  Tarefa.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation




class Tarefa {
    
    var nome:String = ""
    var dataFinal:NSDate = NSDate()
    var tipo:TipoTarefa!
    let materiaNome:String!
    var relevancia:Float = 0.0
    
    
    init (nome:String, dataFinal:NSDate, tipo:Int, materiaNome:String, relevancia:Float){
    
        self.nome = nome
        self.dataFinal = dataFinal
        self.tipo = TipoTarefa.createType(tipo)
        self.materiaNome = materiaNome
        self.relevancia = relevancia
    }
    
}