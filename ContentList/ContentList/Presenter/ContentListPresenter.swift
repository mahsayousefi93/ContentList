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
//        onAppearViewModel.state = .loaded(["R1", "D1", "R2"])
    }
    
    func presentFailure(_ response: ContentListModel.OnApear.Response.Failure) {
        onAppearViewModel.state = .error("Error occurred")
    }
}
