//
//  HttpService.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case badRequest
    case noData
    case decodingError
}



class HttpService {
    
    func getGamePopular(completion: @escaping (Result<[Game]?, NetworkError>) -> Void) {
        
        var components = URLComponents(string: "\(globalParams.endPoint)/games")!
        
        components.queryItems = [
            URLQueryItem(name: "page_size", value: String(globalParams.defaultPageSize)),
            URLQueryItem(name: "key", value: globalParams.API_KEY)
        ]
        
        let url = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print("No Data")
                return completion(.failure(.noData))
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Invalid Response")
                return completion(.failure(.noData))
            }
            
            if response.statusCode != 200 {
                print("HTTP Status: \(response.statusCode)")
                return completion(.failure(.noData))
            }
            
            guard let gameResponse = try? JSONDecoder().decode(GamesResponse.self, from: data) else {
                print("Decode error")
                return completion(.failure(.decodingError))
            }
            
            completion(.success(gameResponse.results))
            
        }.resume()
        
    }
    
    func getGamesBy(search: String, completion: @escaping (Result<[Game]?, NetworkError>) -> Void) {
        
        var components = URLComponents(string: "\(globalParams.endPoint)/games")!
        
        components.queryItems = [
            URLQueryItem(name: "page_size", value: String(globalParams.defaultPageSize)),
            URLQueryItem(name: "search", value: search),
            URLQueryItem(name: "key", value: globalParams.API_KEY)
        ]
        
        let url = URLRequest(url: components.url!)
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                print("No Data")
                return completion(.failure(.noData))
            }
            
            guard let response = response as? HTTPURLResponse else {
                print("Invalid Response")
                return completion(.failure(.noData))
            }
            
            if response.statusCode != 200 {
                print("HTTP Status: \(response.statusCode)")
                return completion(.failure(.noData))
            }
            
            guard let gameResponse = try? JSONDecoder().decode(GamesResponse.self, from: data) else {
                print("Decode error")
                return completion(.failure(.decodingError))
            }
            
            completion(.success(gameResponse.results))
            
        }.resume()
    }
    
    func getGameDetail(id: String, completion: @escaping (Result<GamesDetail?, NetworkError>) -> Void) {

        var components = URLComponents(string: "\(globalParams.endPoint)/games/\(id)")!
        
        components.queryItems = [
            URLQueryItem(name: "key", value: globalParams.API_KEY)
        ]
        
        let url = URLRequest(url: components.url!)
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
                        
            guard let data = data, error == nil else {
                print("No Data")
                return completion(.failure(.noData))
            }
            
            
            guard let gameResponse = try? JSONDecoder().decode(GamesDetail.self, from: data) else {
                print("Decode error")
                return completion(.failure(.decodingError))
            }
            
            completion(.success(gameResponse))
            
        }.resume()
        
    }
    
}
