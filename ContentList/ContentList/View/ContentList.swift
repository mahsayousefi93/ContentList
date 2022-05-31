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
        Text("").onAppear {
            interactor.onAppear(.init())
        }
    }
}
