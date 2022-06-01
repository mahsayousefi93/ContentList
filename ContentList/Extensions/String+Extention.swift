//
//  String+Extention.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import Foundation

extension String {
    
    func toDate(_ format: Formats) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        return dateFormatter.date(from: self)
    }
}
