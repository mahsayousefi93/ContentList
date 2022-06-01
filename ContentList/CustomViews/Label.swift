//
//  Label.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-06-01.
//

import SwiftUI

struct LabelView: View {
    let text: String
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
            .background(.yellow)
            .cornerRadius(10)
            .font(.system(.caption2).bold())
            .foregroundColor(.primary)
    }
}
