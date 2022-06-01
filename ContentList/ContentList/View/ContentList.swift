//
//  ContentView.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import SwiftUI

struct ContentList: View {
    
    let interactor: ContentListInteractorProtocol
    @ObservedObject var viewModel: ContentListModel.OnApear.ViewModel
    
    var body: some View {
        ScrollView {
            switch viewModel.state {
            case .idle:
                Color.clear
            case .loaded(let rows):
                ForEach(rows, id: \.title) { item in
                    ContentRow(viewModel: item)
                }
            case .loading:
                ProgressView()
            case .error(let error):
                Text(error ?? "Error")
            }
        }.onAppear {
            interactor.onAppear(.init())
        }
    }
}
