//
//  Date+Extension.swift
//  RegoApp
//
//  Created by Shamas on 29/9/20.
//

import Foundation

extension Date {
    
    static let iosDateFormatter: ISO8601DateFormatter = {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions.insert(.withFractionalSeconds)
        return formatter
    }()
    
    static let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM yy"
        return formatter
    }()
    
    static func dateFromString(dateString: String) -> Date? {
        return iosDateFormatter.date(from: dateString)
    }
    
    static func formattedDateFromString(dateString: String) -> String {
        guard let date = dateFromString(dateString: dateString) else {
            return ""
        }
        return displayDateFormatter.string(from: date)
    }
}
