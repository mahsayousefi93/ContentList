//
//  ContentRow.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import SwiftUI

struct ContentRow: View {
    
    class ViewModel: ObservableObject {
        @Published var title: String = ""
        @Published var date: String = ""
        @Published var logo: String = ""
        
        @Published var upperHeading: String? = nil
        @Published var subtitle: String? = nil
    }
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(systemName: "info")
            
            VStack(alignment: .leading, spacing: 16) {
                if let upperHeading = viewModel.upperHeading {
                    Text(upperHeading)
                }
                Text(viewModel.title)
                Text(viewModel.date)
                if let subtitle = viewModel.subtitle {
                    Text(subtitle)
                }
            }
        }.padding()
    }
}
