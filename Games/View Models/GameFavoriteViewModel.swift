//
//  GameFavoriteViewModel.swift
//  Games
//
//  Created by HIS nutech on 16/09/22.
//

import Foundation

class GameFavoriteViewModel: ObservableObject {
    
    @Published var games = [GameViewModel]()
    @Published var search: String = ""
   
    func getSavedGames() {
        let result = CoreDataManager.shared.getAllData()
        print(result)
        games = result.map(GameViewModel.init)
    }
    
    func filterGame() -> [GameViewModel] {
        return search.isEmpty ? games : games.filter { $0.name.contains(search)}
    }
    
}
