//
//  UserInfo.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 18/09/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation

class UserInfo {
    var materias:[Materia]?
    
    class var sharedInstance:UserInfo{
        get {
            struct _Singleton {
                static let instance = UserInfo()
            }
            return _Singleton.instance
        }
    }
    
    private init(){
        //println("Singleton 'UserInfo' instanciado.")
    }
}