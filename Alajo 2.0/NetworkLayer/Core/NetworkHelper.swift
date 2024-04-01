//
//  NetworkHelper.swift
//  URLSessionProject
//
//  Created by God's on 30.01.24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

enum ErrorTypes: String, Error {
    case authError = "Auth Error"
    case generalError = "General"
    case unknownError = "Unknown Error"
    case invalidData = "Invalid Data"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://api.themoviedb.org/3/"
    let header = [
        "accept": "application/json",
        "Authorization": "Bearer \(String(data: KeychainHelper.retrieveData(forService: "token")!, encoding: .utf8) ?? "") "
    ]
    
    func requestURL(url: String) -> String {
        baseURL + url
    }
}
