//
//  Dia.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 16/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation

class Dia {
    
    var rawValue:Int = 0
    private(set) var string = ""
    
    private init(rawValue:Int) {
        
        self.rawValue = rawValue
        
        switch rawValue {
        
        case 0:
            string = NSLocalizedString("Segunda", comment: "")
            break
        case 1:
            string = NSLocalizedString("Terca", comment: "")
            break
        case 2:
            string = NSLocalizedString("Quarta", comment: "")

            break
        case 3:
            string = NSLocalizedString("Quinta", comment: "")

            break
        case 4:
            string = NSLocalizedString("Sexta", comment: "")

            break
        case 5:
            string = NSLocalizedString("Sabado", comment: "")

            break
        case 6:
            string = NSLocalizedString("Domingo", comment: "")

            break
        default:
            string = NSLocalizedString("Segunda", comment: "")
            break
        }
    }
    
    private init() {
    }
    
    
    class func createDay (rawValue:Int)->Dia {
        if rawValue > 0 && rawValue <= 6 {
            return Dia(rawValue: rawValue)
        }
        return Dia()
    }
    
    class func returnString(rawValue:Int)->String{
    
        switch rawValue {
        case 0:
            return NSLocalizedString("Segunda", comment: "")
        case 1:
            return NSLocalizedString("Terca", comment: "")
        case 2:
            return NSLocalizedString("Quarta", comment: "")
        case 3:
            return NSLocalizedString("Quinta", comment: "")
        case 4:
            return NSLocalizedString("Sexta", comment: "")
        case 5:
            return NSLocalizedString("Sabado", comment: "")
        case 6:
            return NSLocalizedString("Domingo", comment: "")
        default:
            return "None"
        }
    }
    
    class func getDaysAbbreviations(rawValues:[Int]) ->String{
    
        var str = ""
        let abbreviations = ["Seg","Ter","Quar","Qui","Sex","Sab","Dom"]

        if rawValues.isEmpty {
            return NSLocalizedString("Nenhum", comment: "")
        }
        if rawValues.count == 7 {
            return NSLocalizedString("Todos", comment: "")
        }
        
        for var i = 0; i < 7 ; i++ {
        
            if let _ = rawValues.indexOf(i) {
                str += abbreviations[i]
            }
        }
    
        return str
    }
    
    
    
}//End of class