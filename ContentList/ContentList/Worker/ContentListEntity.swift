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

struct ContentListEntity {
    let title: String
    let date: Date?
    let sender: String?
    let type: String?
    let imageURL: URL?
}

