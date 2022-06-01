//
//  ContentView.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import SwiftUI

class ContentListSectionViewModel: ObservableObject, Identifiable {
    @Published var title: String = ""
    @Published var rows: [ContentRowViewModel] = []
    
    init(title: String, rows: [ContentRowViewModel]) {
        self.title = title
        self.rows = rows
    }
    
}
struct ContentList: View {
    
    let interactor: ContentListInteractorProtocol
    @ObservedObject var viewModel: ContentListModel.OnApear.ViewModel
    
    var body: some View {
        NavigationView {
            switch viewModel.state {
            case .idle:
                Color.clear
            case .loaded(let sections):
                List {
                    ForEach(sections) { section in
                        Section(header: Text(section.title)) {
                            ForEach(section.rows) { row in
                                ContentRow(viewModel: row)
                            }
                        }
                    }
                }.listStyle(GroupedListStyle())
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
