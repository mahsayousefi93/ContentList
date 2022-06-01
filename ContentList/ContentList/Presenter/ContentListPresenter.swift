//
//  ContentListPresenter.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import Foundation

protocol ContentListPresenterProtocol {
    func presentLoading()
    func presentList(_ response: ContentListModel.OnApear.Response.Success)
    func presentFailure(_ response: ContentListModel.OnApear.Response.Failure)
}

struct ContentListPresenter: ContentListPresenterProtocol {
    
    let onAppearViewModel: ContentListModel.OnApear.ViewModel
    
    func presentLoading() {
        onAppearViewModel.state = .loading
    }
    
    func presentList(_ response: ContentListModel.OnApear.Response.Success) {
        onAppearViewModel.state = .loaded(createSectionViewModel(response.data))
    }
    
    func presentFailure(_ response: ContentListModel.OnApear.Response.Failure) {
        onAppearViewModel.state = .error("Error occurred")
    }
}

extension ContentListPresenter {
    
    private func createRowViewModel(_ model: ContentListEntity) -> ContentRowViewModel {
        ContentRowViewModel.init(title: model.title,
                                 date: model.date.format(),
                                 logo: getLogo(model.itemType),
                                 upperHeading: getUpperHeading(model.itemType),
                                 subtitle: model.itemSender)
        
    }
    
    private func createSectionViewModel(_ list: [ContentListEntity]) -> [ContentListSectionViewModel] {
        let dictionary = Dictionary(grouping: list) { $0.date.format(.MMMMyyyy) }
        let sections = dictionary.map { item in
            ContentListSectionViewModel(title: item.key,
                                        rows: item.value.map(createRowViewModel))
        }
        return sections.sorted { $0.title.toDate(.MMMMyyyy) ?? Date() < $1.title.toDate(.MMMMyyyy) ?? Date() }
    }
    
    private func getUpperHeading(_ type: ContentType) -> String? {
        switch type {
        case .receipt(let type):
            return type == ReceiptType.return ? type.rawValue : nil
        case .doc:
            return nil
        }
    }
    
    private func getLogo(_ type: ContentType) -> String {
        return type == .doc ? "doc.text.fill" : "doc.plaintext"
    }
}
