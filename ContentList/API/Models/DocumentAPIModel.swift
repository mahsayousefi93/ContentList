//
//  DocumentAPIModel.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

struct DocumentAPIModel: Decodable {
    let key, sender, senderName, createdAt: String
    let generatedAt: Date
    let subject, status: String
    let labels: Label
    let indexedAt: Date
    let payDate: Date?
    let dueDate: Date?
    let payable: Bool
    let amount, currency, paymentStatus: String?
    let agreementKey, agreementStatus: String?
    let variableAmount: Bool
}

struct Label: Codable {
    let agreement, paid, trashed, viewed: Bool
    let seen: Bool?
}
