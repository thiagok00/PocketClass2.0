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
    
    func tempoRestante() ->Int{
        
        
        let tempo = self.dataFinal.timeIntervalSinceNow/60/60/24
        var tempoRestante:Double = tempo
        
        tempoRestante++
        
        if(tempoRestante<0) {
            tempoRestante--
        }
        
        return Int(tempoRestante)
    }
    
    func getStringTempoRestante()->String {
    
        let diasRestantes = tempoRestante()
        
        if diasRestantes < 0 {
            return "Tarefa expirada."
        }
        if diasRestantes == 0 {
            return "Hoje."
        }
        if diasRestantes == 1 {
            return "Falta 1 dia."
        }
        else {
            return "Faltam \(diasRestantes) dias."
        }
    
    }
    

    
}//End of Class