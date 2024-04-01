//
//  MovieManager.swift
//  URLSessionProject
//
//  Created by Fagan Aslanli on 30.01.24.
//

import Foundation

class MovieManager {
    static let shared = MovieManager()
    
    func getPopularMovieList(pageID: Int, complete: @escaping((PopularMovieModel?, String?) -> Void)) {
        let url = "\(MovieHelper.popular.path)\(pageID)"
        NetworkManager.shared.request(
            type: PopularMovieModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
    
    func getTodayMovieList(pageID: Int, complete: @escaping((TodayMovieModel?, String?) -> Void)) {
        let url = "\(MovieHelper.today.path)\(pageID)"
        NetworkManager.shared.request(
            type: TodayMovieModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
    
    func getThisWeekMovieList(pageID: Int, complete: @escaping((ThisWeekMovieModel?, String?) -> Void)) {
        let url = "\(MovieHelper.today.path)\(pageID)"
        NetworkManager.shared.request(
            type: ThisWeekMovieModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
    
    func getTopRatedMovieList(pageID: Int, complete: @escaping((TopRatedMovieModel?, String?) -> Void)) {
        let url = "\(MovieHelper.today.path)\(pageID)"
        NetworkManager.shared.request(
            type: TopRatedMovieModel.self,
            url: url,
            header: NetworkHelper.shared.header,
            method: .get) { response in
            switch response {
            case .success(let data):
                complete(data, nil)
            case .failure(let error):
                complete(nil, error.rawValue)
            }
        }
    }
}
