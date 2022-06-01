//
//  LoadableContent.swift
//  ContentList
//
//  Created by Mahsa Yousefi on 2022-05-31.
//

import Foundation

enum LoadableContent<Model, ErrorViewModel> {
    case idle
    case loaded(Model)
    case error(ErrorViewModel)
    case loading
}
