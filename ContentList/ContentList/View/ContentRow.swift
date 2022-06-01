//
//  ContentRow.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import SwiftUI

class ContentRowViewModel: ObservableObject {
    @Published var title: String
    @Published var date: String
    @Published var logo: String
    
    @Published var upperHeading: String?
    @Published var subtitle: String?
    
    init(title: String, date: String, logo: String, upperHeading: String?, subtitle: String?) {
        self.title = title
        self.date = date
        self.logo = logo
        self.upperHeading = upperHeading
        self.subtitle = subtitle
    }
}

struct ContentRow: View {
    
    @ObservedObject var viewModel: ContentRowViewModel
    
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
