//
//  ContentRow.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import SwiftUI

class ContentRowViewModel: ObservableObject, Identifiable {
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
            
            Image(systemName: viewModel.logo)
                .font(.system(size: 40))
                .foregroundColor(.green)
            
            VStack(alignment: .leading, spacing: 8) {
                
                if let upperHeading = viewModel.upperHeading {
                    LabelView(text: upperHeading)
                }
                
                Text(viewModel.title)
                    .font(.headline)
                Text(viewModel.date)
                    .font(.subheadline)
                
                if let subtitle = viewModel.subtitle {
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .padding()
        }
    }
}
