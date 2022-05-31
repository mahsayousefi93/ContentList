//
//  ContentWorker.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import Foundation

protocol ContentWorkerProtocol {
    func fetchContent() async throws -> [ContentListEntity]
}

struct ContentWorkerFacade: ContentWorkerProtocol {

    let recipetWorler: ContentWorkerProtocol?
    let documentWorker: ContentWorkerProtocol?
    
    func fetchContent() async throws -> [ContentListEntity] {
        let receipt = try await recipetWorler?.fetchContent()
        let documents = try await documentWorker?.fetchContent()
        var all = receipt
        all?.append(contentsOf: documents ?? [])
        return all ?? []
        
    }
    
}
