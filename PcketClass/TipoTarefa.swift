//
//  Dia.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 16/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation

class TipoTarefa {
    
    var rawValue:Int = 0
    private(set) var string = ""
    
    private init(rawValue:Int) {
        
        self.rawValue = rawValue
        self.string = TipoTarefa.returnString(rawValue)
        
    }
    
    private init() {
    }
    
    
    class func createType (rawValue:Int)->TipoTarefa {
        if rawValue >= 0 && rawValue <= 4 {
            return TipoTarefa(rawValue: rawValue)
        }
        return TipoTarefa()
    }
    
    class func returnString(rawValue:Int)->String{
        
        switch rawValue {
        case 0:
            return NSLocalizedString("Trabalho", comment: "")
        case 1:
            return NSLocalizedString("Prova", comment: "")
        case 2:
            return NSLocalizedString("Apresentacao", comment: "")
        case 3:
            return NSLocalizedString("Teste", comment: "")
        case 4:
            return NSLocalizedString("Lista", comment: "")
        default:
            return "None"
        }
    }
    
    
    
}//End of class