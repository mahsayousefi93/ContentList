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
        let receiptAPIModels = try await networkAPI.fetchReceipt()
        return receiptAPIModels.map(mapReceipt)
    }
    
    private func mapReceipt(_ receipt: ReceiptAPIModel) -> ContentListEntity {
        return .init(title: receipt.storeName,
                     date: receipt.purchaseDate,
                     sender: nil,
                     type: receipt.type.rawValue,
                     imageURL: nil)
    }
}
