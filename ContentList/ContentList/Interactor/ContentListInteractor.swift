//
//  ContentListInteractor.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import Foundation

protocol ContentListInteractorProtocol {
    func onAppear(_ request: ContentListModel.OnApear.Request)
}

struct ContentListInteractor: ContentListInteractorProtocol {
    
    let presenter: ContentListPresenterProtocol
    let worker: ContentWorkerProtocol
    
    func onAppear(_ request: ContentListModel.OnApear.Request) {
        getContentList()
    }
}

extension ContentListInteractor {
    
    private func getContentList() {
        presenter.presentLoading()
        Task {
            do {
                let contents = try await worker.fetchContent()
                await MainActor.run { presenter.presentList(.init(data: contents)) }
            }
            catch let error {
                await MainActor.run { presenter.presentFailure(.init(error: ContentListError.unknown)) }
            }
        }
    }
}
