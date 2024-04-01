//
//  SearchManager.swift
//  Alajo
//
//  Created by God's on 3/29/24.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()
    
    func getSearchList(query: String, complete: @escaping((SearchModel?, String?) -> Void)) {
        let url = "https://api.themoviedb.org/3/search/movie?query=\(query)&include_adult=false&language=en-US&page=1"
        NetworkManager.shared.request(
            type: SearchModel.self,
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
