//
//  MovieHelper.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 31.01.24.
//

import Foundation
enum MovieHelper: String {
    case popular = "movie/popular?language=en-US&page="
    case today = "trending/movie/day?language=en-US&page="
    case week  = ""
    case topRated = "trending/movie/week?language=en-US&page="

    var path: String {
        return NetworkHelper.shared.requestURL(url: self.rawValue)
    }
}
