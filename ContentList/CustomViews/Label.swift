//
//  Label.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import SwiftUI

//This also can be implemented as ViewModifier
struct LabelView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.yellow.opacity(0.5))
            .cornerRadius(10)
            .font(.system(size: 10).bold())
            .foregroundColor(.primary)
    }
}
