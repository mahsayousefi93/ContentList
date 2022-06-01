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
                await handleSuccessResponse(contents)
            }
            catch {
                await MainActor.run { presenter.presentFailure(.init(error: ContentListError.unknown)) }
            }
        }
    }
    
    @MainActor private func handleSuccessResponse(_ contents: [ContentListEntity]) {
        guard !contents.isEmpty else {
            presenter.presentFailure(.init(error: .emptyList))
            return
        }
        presenter.presentList(.init(data: contents))
    }
}
