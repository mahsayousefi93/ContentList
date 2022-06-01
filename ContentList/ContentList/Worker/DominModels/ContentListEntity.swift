//
//  ContentListEntity.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import Foundation

enum ContentListError: Error {
    case emptyList
    case unknown
}

enum ContentType: Hashable {
    case receipt(type: ReceiptType)
    case doc
}

protocol ContentListEntity {
    var title: String { get }
    var date: Date { get }
    var itemSender: String? { get }
    var itemType: ContentType { get }
}

