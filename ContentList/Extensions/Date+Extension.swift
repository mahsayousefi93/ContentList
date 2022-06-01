//
//  Date+Extension.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import Foundation

extension Date {
    
    func format(_ format: String = "yyyy-MM-dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}
