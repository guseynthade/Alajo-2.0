//
//  NetworkManager.swift
//  URLSessionProject
//
//  Created by God's on 30.01.24.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(
        type: T.Type,
        url: String,
        header: [String: String] = [:],
        body: [String: Any] = [:],
        method: HTTPMethods,
        completion: @escaping((Result<T,ErrorTypes>) -> Void)) {
            let session = URLSession.shared
            guard let url = URL(string: url) else {return}
            
            print("url: \(url)")
            var request = URLRequest(url: url)
            
            request.httpMethod = method.rawValue
            if !body.isEmpty {
                let bodyData = try? JSONSerialization.data(withJSONObject: body, options: [])
                request.httpBody = bodyData
                print("body: \(String(data: try! JSONSerialization.data(withJSONObject: body, options: .prettyPrinted), encoding: .utf8)!)")
            }
            
            request.allHTTPHeaderFields = header
            print("header: \(header)")
            
            let dataTask = session.dataTask(with: request) { [weak self] data, response, error in
                let statusCode = (response as! HTTPURLResponse).statusCode
                print("responseCode: \(statusCode)")
                if statusCode == 401 {
                    completion(.failure(.authError))
                    return
                }
                
                guard let self = self else {return}
                if let _ = error {
                    completion(.failure(.generalError))
                } else if let data = data {
                    self.handleResponse(data: data) { response in
                        completion(response)
                    }
                } else {
                    completion(.failure(.unknownError))
                }
            }
            
            DispatchQueue.global(qos: .background).async {
                dataTask.resume()
            }
        }
    
    fileprivate func handleResponse<T: Codable>(
        data: Data,
        completion: @escaping((Result<T,ErrorTypes>) -> Void)) {
            do {
                let result = try JSONDecoder().decode(T.self, from: data)
                print("response: \(result)")
                completion(.success(result))
            } catch {
                completion(.failure(.invalidData))
            }
        }
}
