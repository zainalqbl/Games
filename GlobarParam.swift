//
//  GlobarParam.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import Foundation

struct globalParams {
    static let API_KEY = "XXXXXXX"
    static let endPoint = "https://api.rawg.io/api"
    static let defaultPageSize = 30
    
    static let sampleListGame: [Game] = [sampleGame2, sampleGame1]
    
    static let sampleGame1 = Game(
        id: 3498,
        slug: "grand-theft-auto-v",
        name: "Grand Theft Auto V",
        released: "2013-09-17",
        backgroundImage: "https://media.rawg.io/media/games/456/456dea5e1c7e3cd07060c14e96612001.jpg",
        rating: 4.47,
        tags: [genre2, genre1],
        genres: [genre1, genre2]
        )
    
    static let sampleGame2 = Game(
        id: 3498,
        slug: "the-witcher-3-wild-hunt",
        name: "The Witcher 3: Wild Hunt",
        released: "2015-05-18",
        backgroundImage: "https://media.rawg.io/media/games/618/618c2031a07bbff6b4f611f10b6bcdbc.jpg",
        rating: 4.67,
        tags: [genre2, genre1],
        genres: [genre1, genre2]
        )
    
    static let genre1 = Genre(id: 4,
                              name: "Action",
                              slug: "action",
                              gamesCount: 160704,
                              imageBackground: "https://media.rawg.io/media/games/bc0/bc06a29ceac58652b684deefe7d56099.jpg",
                              domain: nil,
                              language: nil)
    
    static let genre2 =  Genre(id: 5,
                               name: "Adventure",
                               slug: "adventure",
                               gamesCount: 160704,
                               imageBackground: "https://media.rawg.io/media/games/bc0/bc06a29ceac58652b684deefe7d56099.jpg",
                               domain: nil,
                               language: "eng")
    
    static let sampleDetailGame = GamesDetail(id: 3498,
                                              name: "Grand Theft Auto V",
                                              gamesDetailDescription: "<p>Rockstar Games went bigger, since their previous installment of the series. You get the complicated and realistic world-building from Liberty City of GTA4 in the setting of lively and diverse Los Santos, from an old fan favorite GTA San Andreas. 561 different vehicles (including every transport you can operate) and the amount is rising with every update. <br />\nSimultaneous storytelling from three unique perspectives: <br />\nFollow Michael, ex-criminal living his life of leisure away from the past, Franklin, a kid that seeks the better future, and Trevor, the exact past Michael is trying to run away from. <br />\nGTA Online will provide a lot of additional challenge even for the experienced players, coming fresh from the story mode. Now you will have other players around that can help you just as likely as ruin your mission. Every GTA mechanic up to date can be experienced by players through the unique customizable character, and community content paired with the leveling system tends to keep everyone busy and engaged.</p>",
                                              released: "2013-09-17",
                                              rating: 4.47,
                                              backgroundImage: "https://media.rawg.io/media/games/bc0/bc06a29ceac58652b684deefe7d56099.jpg",
                                              developers: [genre2],
                                              genres: [genre2],
                                              tags: [genre2],
                                              publishers: [genre2])
    
    static let developer1 = Developer(id: 2151, name: "Rockstar Games", domain: "epicgames.com", language: "eng")
}
