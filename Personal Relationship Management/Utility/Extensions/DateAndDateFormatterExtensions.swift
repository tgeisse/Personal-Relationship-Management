//
//  DateAndDateFormatterExtensions.swift
//  Personal Relationship Management
//
//  Created by Taylor Geisse on 3/22/23.
//

import Foundation

extension Date {
    init?(from: String, format: DateFormat) {
        let formatter = DateFormatter()
        
        if format == .iso8601UTC { formatter.timeZone = TimeZone(identifier: "UTC") }
        
        formatter.dateFormat = format.rawValue
        
        if let goodDate = formatter.date(from: from) { self = goodDate }
        else { return nil }
    }
    
    func getDateByAdding(years: Int? = nil, months: Int? = nil, days: Int? = nil) -> Date {
        let calendar = Calendar.current
        var newDate = self
        
        if let years = years { newDate = calendar.date(byAdding: .year, value: years, to: newDate)! }
        if let months = months { newDate = calendar.date(byAdding: .month, value: months, to: newDate)! }
        if let days = days { newDate = calendar.date(byAdding: .day, value: days, to: newDate)! }
        
        return newDate
    }
    
    func getDateFor(hour: Int? = nil, minute: Int?, second: Int? = nil) -> Date {
        if hour == nil && minute == nil && second == nil { return self }
        
        let calendar = Calendar.current
        
        let hour = hour ?? calendar.component(.hour, from: self)
        let minute = minute ?? calendar.component(.minute, from: self)
        let second = second ?? calendar.component(.second, from: self)
        
        return calendar.date(bySettingHour: hour, minute: minute, second: second, of: self)!
    }
    
    func stringFormat(_ format: DateFormat) -> String {
        DateFormatter().dateString(self, format: format)
    }
}

extension DateFormatter {
    func dateString(_ date: Date, format: DateFormat) -> String {
        let formatter = self
        
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = format.rawValue
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        
        return formatter.string(from: date)
    }
}
