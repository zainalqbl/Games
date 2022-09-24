//
//  Games.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import Foundation

struct GamesResponse: Codable {
    let count: Int
    let next: String?
    let results: [Game]
}

struct Game: Codable {
    let id: Int
    let slug, name: String
    let released: String?
    let backgroundImage: String?
    let rating: Double
    let tags: [Genre]
    let genres: [Genre]
    
    enum CodingKeys: String, CodingKey {
        case id, slug, name, released
        case backgroundImage = "background_image"
        case rating
        case genres, tags
    }
}

struct Genre: Codable, Equatable {
    let id: Int
    let name, slug: String
    let gamesCount: Int?
    let imageBackground: String?
    let domain: String?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
        case domain, language
    }
}
