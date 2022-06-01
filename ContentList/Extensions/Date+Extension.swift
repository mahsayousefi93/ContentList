//
//  Date+Extension.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import Foundation

enum Formats: String {
    case yyyyMMdd = "yyyy-MM-dd"
    case MMMMyyyy = "MMMM yyyy"
}

extension Date {
    
    func format(_ format: Formats = .yyyyMMdd) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.string(from: self)
    }
}
