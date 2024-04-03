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
    
    private var popularList: [PopularResult]?
    private var todayList: [TodayResult]?
    private var weekList: [WeekResult]?
    private var ratedList: [RatedResult]?
    private var searchList: [SearchResult]?
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
            } else if let responseData = responseData?.results {
                self.popularList = responseData
                self.successCallback?()
            }
        }
    }
    
    func getTodayMovieList() {
        MovieManager.shared.getTodayMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                self.todayList = responseData
                self.successCallback?()
            }
        }
    }
    
    func getThisWeekMovieList() {
        MovieManager.shared.getThisWeekMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                self.weekList = responseData
                self.successCallback?()
            }
        }
    }
    
    func getTopRatedMovieList() {
        MovieManager.shared.getTopRatedMovieList(pageID: 1) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                self.ratedList = responseData
                self.successCallback?()
            }
        }
    }
    
    func getSearchList(text: String) {
        SearchManager.shared.getSearchList(query: text) { [weak self] responseData, errorString in
            guard let self = self else {return}
            
            if let errorString = errorString {
                self.errorCallback?(errorString)
            } else if let responseData = responseData?.results {
                self.searchList = responseData
                self.successCallback?()
            }
        }
    }
}
