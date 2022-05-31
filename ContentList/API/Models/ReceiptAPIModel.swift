//
//  ReceiptAPIModel.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

struct ReceiptAPIModel: Decodable {
    let type: ReceiptType
    let storeName: String
    let chainID, storeID, receiptID: String?
    let amount: Int
    let currency: String
    let purchaseDate: Date
    let description: String
    let isCopy, isExpensed, isRefund: Bool
    let discount: Int
    let storeIconID: String?
}

enum ReceiptType: String, Decodable {
    case sale = "SALE"
    case `return` = "RETURN"
}
