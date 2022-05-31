//
//  ContentListApp.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import SwiftUI

@main
struct ContentListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentListConfigurator().getView()
        }
    }
}
