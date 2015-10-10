//
//  Aula.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation

enum Dia:String {
    case Segunda = "Segunda"
    case Terca = "Terca"
    case Quarta = "Quarta"
    case Quinta = "Quinta"
    case Sexta = "Sexta"
    case Sabado = "Sabado"
    case Domingo = "Domingo"
}


class Aula{
    
    private(set) var dia:Dia!
    private(set) var sala:String = ""
    private(set) var horaComeco = 0
    private(set) var horaFinal = 0
    
    
    
    
    init (dia:Dia,sala:String,horaComeco:Int, horaFinal:Int) {
    
        self.dia = dia
        self.sala = sala
        self.horaComeco = horaComeco
        self.horaFinal = horaFinal
    
    }
    
    
    
    
} // End of Class