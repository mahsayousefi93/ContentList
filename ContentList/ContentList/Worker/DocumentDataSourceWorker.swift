//
//  DocumentDataSourceWorker.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

struct DocumentDataSourceWorker: ContentDataSourceWorkerProtocol {
    
    func fetchContent() async throws -> [ContentListEntity] {
        return []
    }
    
}
