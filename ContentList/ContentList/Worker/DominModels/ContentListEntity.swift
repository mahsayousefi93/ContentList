//
//  ContentListEntity.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import Foundation

enum ContentListError: Error {
    case emptyList
    case noInternetConnection
    case unknown
}

protocol ContentListEntity {
    var title: String { get }
    var date: Date { get }
    var itemSender: String? { get }
    var itemType: String? { get }
}

