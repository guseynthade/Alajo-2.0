//
//  HomeViewModel.swift
//  Alajo
//
//  Created by God's on 3/5/24.
//

import Foundation

protocol HomeProtocol: AnyObject {
    func success()
    func error(errorMessage: String)
}

final class HomeViewModel {
    
    private var popularList: PopularMovieModel?
    private var todayList: TodayMovieModel?
    private var weekList: ThisWeekMovieModel?
    private var ratedList: TopRatedMovieModel?
    private var searchList: SearchModel?
    private var movieList: [MovieCellProtocol] = []
    
    var successCallback: (() -> Void)?
    var errorCallback: ((String) -> Void)?
    var selectedMovie: MovieCellProtocol?
    
    func getMovieForType(type: SegmentType) {
            switch type {
            case .TopRated:
                getTopRatedMovieList()
                print("movieList")
            case .ThisWeek:
                getThisWeekMovieList()
                print("getThisWeekMovieList")
            case .Popular:
                getPopularMovieList()
                print("popularList")
            case .Today:
                getTodayMovieList()
                print("getTodayMovieList")
            }
        }
    
    
    
    func getMovieList() -> [MovieCellProtocol] {
        return movieList
    }
    
    func getMoviesCount() -> Int{
            return movieList.count
        }
    
    // MARK: Network
    
    func getPopularMovieList() {
        MovieManager.shared.getPopularMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.popularList = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }
    }
    
    func getTodayMovieList() {
        MovieManager.shared.getTodayMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.todayList = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }
    }
    
    func getThisWeekMovieList() {
        MovieManager.shared.getThisWeekMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.weekList = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }
    }
    
    func getTopRatedMovieList() {
        MovieManager.shared.getTopRatedMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.ratedList = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }
    }
    
    
    func getSearchList(text: String) {
        SearchManager.shared.getSearchList(query: text) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData {
                self.searchList = responseData
                self.movieList = responseData.results ?? []
                self.successCallback?()
            }
        }
    }
}
