//
//  GameDetailViewModel.swift
//  Games
//
//  Created by HIS nutech on 13/09/22.
//

import Foundation

class GameDetailViewModel: ViewModelBase {
    
    @Published var gamesDetails: GamesDetail?
    @Published var games: Game?
    @Published var isFavorite: Bool = false
    
    private var httpService = HttpService()
    
    init(gamesDetails: GamesDetail? = nil) {
        self.gamesDetails = gamesDetails
    }
    
    func getDetailsGame(id: String) {
        
        self.loadingState = .loading
        
        print("Get Details \(id)")
        
        httpService.getGameDetail(id: id) { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.gamesDetails = details
                    self.loadingState = .success
                    self.games = self.getGame()
                    self.checkDataEksis(id: Int(id)!)
                }
            case .failure(let errors):
                print(errors.localizedDescription)
                DispatchQueue.main.async {
                    self.loadingState = .failed
                }
            }
        }
    }
    
    func savedGame(gamesDetail : Game) {
        CoreDataManager.shared.saveData(game:  gamesDetail)
    }
    
    func checkDataEksis(id: Int) {
        let result = CoreDataManager.shared.getDatabyID(id: id)
        if result == nil {
            isFavorite = false
        } else {
            isFavorite = true
        }
        
    }
    
    func deteleFavorite(id: Int) {
        CoreDataManager.shared.deleteData(id: id)
    }
    
    func getGame() -> Game {
        return Game(id: id,
                    slug: name,
                    name: name,
                    released: released,
                    backgroundImage: backgroundImage,
                    rating: rating,
                    tags: tags,
                    genres: genres)
    }
    
    func getMessageAlert() -> String {
        return isFavorite ? "Data Berhasil di Hapus" : "Data Berhasil di Simpan"
    }
    
    var id: Int {
        self.gamesDetails?.id ?? 0
    }
    
    var name: String {
        self.gamesDetails?.name ?? ""
    }
    
    var details: String {
        self.gamesDetails?.gamesDetailDescription ?? ""
    }
    
    var released: String {
        self.gamesDetails?.released ?? ""
    }
    
    var rating: Double {
        self.gamesDetails?.rating ?? 0.0
    }
    
    var backgroundImage: String {
        self.gamesDetails?.backgroundImage ?? ""
    }
    
    var developers: [Genre] {
        self.gamesDetails?.developers ?? []
    }

    var nameDev: String {
        self.gamesDetails?.developers.map({ $0.name }).joined(separator: ", ") ?? ""
    }

    var genres: [Genre] {
        self.gamesDetails?.genres ?? []
    }

    var tags: [Genre] {
        self.gamesDetails?.tags ?? []
    }

    var namePublish: String {
        self.gamesDetails?.publishers.map({ $0.name }).joined() ?? ""
    }

    var publishers: [Genre] {
        self.gamesDetails?.publishers ?? []
    }
}

