//
//  DiasSelecionados.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 15/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation

class DiasSelecionados {
    var array = [String]()
    
    class var sharedInstance:DiasSelecionados{
        get {
            struct _Singleton {
                static let instance = DiasSelecionados()
            }
            return _Singleton.instance
        }
    }
    
    private init(){
        //println("Singleton 'UserInfo' instanciado.")
    }
}