//
//  NetworkManager.swift
//  ShoppingProject
//
//  Created by 최서경 on 5/9/24.
//

import Foundation
enum SeSACError: Error {
    case failedRequset
    case noData
    case invaildResponse
    case invaildData
    case invalidURL
}

@MainActor
class NetworkManager {
    
    static let shared = NetworkManager()
    
    static let url = URL(string: "https://picsum.photos/200/300")!

    func fetchThumbnailAsyncAwait<T: Decodable>(type: T, text: String, sort: String, start: String) async throws -> T {
        let scheme = "https"
        let host = "openapi.naver.com"
        let path = "/v1/search/shop.json"
        
        var component = URLComponents()
        
        component.scheme = scheme
        component.host = host
        component.path = path
        component.queryItems = [
        URLQueryItem(name: "query", value: text),
        URLQueryItem(name: "sort", value: sort),
        URLQueryItem(name: "display", value: "30"),
        URLQueryItem(name: "start", value: start)
        ]
        var request = URLRequest(url: NetworkManager.url, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 5)
        
        request.httpMethod = "GET"
        request.addValue(APIKey.clientID, forHTTPHeaderField: "X-Naver-Client-Id")
        request.addValue(APIKey.clientSecret, forHTTPHeaderField: "X-Naver-Client-Secret")
        
        let (data, response) = try await URLSession.shared.data(for: request)

        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw SeSACError.invaildResponse
        }
        
        let result = try JSONDecoder().decode(T.self, from: data)
        return result
        
    }
    
}
