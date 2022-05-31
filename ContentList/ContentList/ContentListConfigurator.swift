//
//  ContentListConfigurator.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

struct ContentListConfigurator {
    
    func getView() -> ContentList {
        
        let networkAPI = NetworkAPI(jsonDecoder: getJSONDecoder())
        let viewModel = ContentListModel.OnApear.ViewModel()
        
        let receiptWorker = ReceiptWorker(networkAPI: networkAPI)
        let documentWorker = DocumentWorker(networkAPI: networkAPI)
        let facadeWorker = ContentWorkerFacade(recipetWorler: receiptWorker, documentWorker: documentWorker)
        
        let presenter = ContentListPresenter(onAppearViewModel: viewModel)
        let interactor = ContentListInteractor(presenter: presenter, worker: facadeWorker)
        let view = ContentList(interactor: interactor, viewModel: viewModel)
        
        return view 
    }
    
    func getJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }
}
