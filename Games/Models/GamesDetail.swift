//
//  GamesDetail.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import Foundation

struct GamesDetail: Decodable {
    
    let id: Int
    let name, gamesDetailDescription: String?
    let released: String?
    let rating: Double?
    let backgroundImage: String?
    let developers, genres, tags, publishers: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case gamesDetailDescription = "description"
        case released, rating
        case backgroundImage = "background_image"
        case developers, genres, tags, publishers
    }
}

struct Developer: Decodable, Equatable {
    let id: Int
    let name: String?
    let domain: String?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case id, name
        case domain, language
    }
}
