//
//  Extensions.swift
//  PcketClass
//
//  Created by Thiago De Angelis on 16/10/15.
//  Copyright © 2015 Thiago De Angelis. All rights reserved.
//

import Foundation
extension Array where Element: Equatable {
    mutating func removeObject(object: Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
    
    mutating func removeObjectsInArray(array: [Element]) {
        for object in array {
            self.removeObject(object)
        }
    }
}