//
//  ContentListModel.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-30.
//

import Foundation

enum ContentListModel {
    
    enum OnApear {
        struct Request {}
        
        enum Response {
            
            struct Success {
                let data: [ContentListEntity]
            }
            
            struct Failure {
                let error: ContentListError
            }
        }
        
        class ViewModel: ObservableObject {
            @Published var state: LoadableContent<[String], String> = .idle
        }
    }
    
}
