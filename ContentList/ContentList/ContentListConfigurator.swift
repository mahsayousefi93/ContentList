//
//  ContentListConfigurator.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

struct ContentListConfigurator {
    
    func getView() -> ContentList {
        
        let viewModel = ContentListModel.OnApear.ViewModel()
        
        let receiptWorker = ReceiptDataSourceWorker()
        let documentWorker = DocumentDataSourceWorker()
        let facadeWorker = ContentDataSourceWorkerFacade(recipetWorler: receiptWorker, documentWorker: documentWorker)
        
        let presenter = ContentListPresenter(onAppearViewModel: viewModel)
        let interactor = ContentListInteractor(presenter: presenter, worker: facadeWorker)
        let view = ContentList(interactor: interactor, viewModel: viewModel)
        
        return view 
    }
}
