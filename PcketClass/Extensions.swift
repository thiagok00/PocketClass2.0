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

extension NSDate {
    
    func dateFromString(date: String, format: String) -> NSDate {
        let formatter = NSDateFormatter()
        let locale = NSLocale(localeIdentifier: "en_US_POSIX")
        
        formatter.locale = locale
        formatter.dateFormat = format
        return formatter.dateFromString(date)!
    }
    func getCurrentShortDate() -> String {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let DateInFormat = dateFormatter.stringFromDate(self)
        
        return DateInFormat
    }
    class func getDayOfWeek()->Int? {
        let todayDate = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let myComponents = myCalendar?.components(NSCalendarUnit.Weekday, fromDate: todayDate)
        let weekDay = myComponents?.weekday
        return weekDay!
    }
    
    class func getHour()->Int? {
        let todayDate = NSDate()
        let myCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let myComponents = myCalendar?.components(NSCalendarUnit.Hour, fromDate: todayDate)
        let hour = myComponents?.hour
        return hour!
    }
    
}