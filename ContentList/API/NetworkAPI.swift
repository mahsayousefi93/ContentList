//
//  NetworkAPI.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

//This is a very basic protocol act like a network API, in case of a real network layer, it will be written in completely different protocol & methods
protocol NetworkAPIProtocol {
    func fetchReceipt() async throws -> [ReceiptAPIModel]
    func fetchDocuments() async throws -> [DocumentAPIModel]
}

enum NetworkError: Error {
    case notFound
}

struct NetworkAPI: NetworkAPIProtocol {
    
    let jsonDecoder: JSONDecoder
    
    func fetchReceipt() async throws -> [ReceiptAPIModel]  {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        guard let receiptData = try readLocalFile("Receipts") else {
            throw NetworkError.notFound
        }
        return try jsonDecoder.decode([ReceiptAPIModel].self, from: receiptData)
        
    }
    
    func fetchDocuments() async throws -> [DocumentAPIModel]  {
        try await Task.sleep(nanoseconds: 1_000_000_000)
        guard let docsData = try readLocalFile("Documents") else {
            throw NetworkError.notFound
        }
        return try jsonDecoder.decode([DocumentAPIModel].self, from: docsData)
    }
    
    
    private func readLocalFile(_ name: String) throws -> Data? {
        guard let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
           let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) else  {
            return nil
        }
        return jsonData
    }
    
}
