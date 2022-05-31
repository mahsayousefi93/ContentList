//
//  DocumentWorker.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

struct DocumentWorker: ContentWorkerProtocol {
    
    let networkAPI: NetworkAPI
    
    func fetchContent() async throws -> [ContentListEntity] {
        let documentAPIModels = try await networkAPI.fetchDocuments()
        return documentAPIModels.map(mapDocument)
    }
    
    private func mapDocument(_ document: DocumentAPIModel) -> ContentListEntity {
        return .init(title: document.subject,
                     date: document.generatedAt,
                     sender: document.sender,
                     type: nil,
                     imageURL: nil)
    }
    
}
