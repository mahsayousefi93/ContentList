//
//  ContentWorkerProtocol.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import Foundation

protocol ContentWorkerProtocol {
    func fetchContent() async throws -> [ContentListEntity]
}
