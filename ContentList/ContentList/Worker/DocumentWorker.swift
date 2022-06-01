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
        try await networkAPI.fetchDocuments()
    }
    
}
