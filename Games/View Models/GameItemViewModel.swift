//
//  GameItemViewModel.swift
//  Games
//
//  Created by HIS nutech on 12/09/22.
//

import Foundation
import SwiftUI

class GameItemViewModel: ViewModelBase {
    
    @Published var games = [GameViewModel]()
    let httpService = HttpService()
    
    func getGamesPopular() {
        
        self.loadingState = .loading
        
        httpService.getGamePopular { result in
            switch result {
            case .success(let games):
                if let games = games {
                    DispatchQueue.main.async {
                        self.loadingState = .success
                        self.games = games.map(GameViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    func searchGame(search: String) {
        self.loadingState = .loading
        
        httpService.getGamesBy(search: search.trimmedAndEscaped()) { result in
            switch result {
            case .success(let games):
                if let games = games {
                    DispatchQueue.main.async {
                        self.loadingState = .success
                        self.games = games.map(GameViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
}


struct GameViewModel {
    let game: Game
    
    var id: Int {
        game.id
    }
    
    var slug: String {
        game.slug
    }
    
    var name: String {
        game.name
    }
    
    var released: String {
        game.released ?? ""
    }
    
    var backgroundImage: String {
        game.backgroundImage ?? "https://rawg.io/"
    }
    
    var rating: Double {
        game.rating
    }
    
    var genres: [Genre] {
        game.genres
    }
    
    var tags: [Genre] {
        game.tags
    }
}
