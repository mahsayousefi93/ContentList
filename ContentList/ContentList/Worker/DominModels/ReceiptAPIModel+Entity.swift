//
//  ReceiptAPIModel+Entity.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import Foundation

extension ReceiptAPIModel: ContentListEntity {
    
    var title: String { storeName }
    var date: Date { purchaseDate }
    var itemSender: String? { nil }
    var itemType: String? { type.rawValue }
    
}
