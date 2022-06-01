//
//  ReceiptDataSourceWorler.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

struct ReceiptWorker: ContentWorkerProtocol {
    
    let networkAPI: NetworkAPI
    
    func fetchContent() async throws -> [ContentListEntity] {
        try await networkAPI.fetchReceipt()
    }
}
