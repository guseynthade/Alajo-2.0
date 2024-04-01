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
    
    var headerType: HeaderType = .today
    
    func setHeader(index: Int) -> HeaderType {
        switch index {
        case 0:
            getTodayMovieList()
            guard let list = todayList else {return .today}
            movieList = list
            headerType = .today
        case 1:
            getThisWeekMovieList()
            guard let list = weekList else {return .thisWeek}
            movieList = list
            headerType = .thisWeek
        case 2:
            getPopularMovieList()
            guard let list = popularList else {return .popular}
            movieList = list
            headerType = .popular
        case 3:
            getTopRatedMovieList()
            guard let list = ratedList else {return .topRated}
            movieList = list
            headerType = .topRated
        default:
            headerType = .today
            
        }
        return headerType
    }
    
    func getMovieList() -> [MovieCellProtocol] {
        return movieList
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
