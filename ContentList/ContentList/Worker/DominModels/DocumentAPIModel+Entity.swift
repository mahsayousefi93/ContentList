//
//  DocumentAPIModel.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import Foundation

extension DocumentAPIModel: ContentListEntity {
    
    var title: String { subject }
    var date: Date { generatedAt }
    var itemSender: String? { sender }
    var itemType: String? { nil }
}
