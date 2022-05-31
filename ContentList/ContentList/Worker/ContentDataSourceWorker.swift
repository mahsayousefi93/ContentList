//
//  ContentDataSourceWorker.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import Foundation

protocol ContentDataSourceWorkerProtocol {
    func fetchContent() async throws -> [ContentListEntity]
}

struct ContentDataSourceWorkerFacade: ContentDataSourceWorkerProtocol {

    let recipetWorler: ContentDataSourceWorkerProtocol?
    let documentWorker: ContentDataSourceWorkerProtocol?
    
    func fetchContent() async throws -> [ContentListEntity] {
        let receipt = try await recipetWorler?.fetchContent()
        let documents = try await documentWorker?.fetchContent()
        var all = receipt
        all?.append(contentsOf: documents ?? [])
        return all ?? []
        
    }
    
}
