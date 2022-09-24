//
//  CoreDataManager.swift
//  Games
//
//  Created by HIS nutech on 15/09/22.
//

import CoreData

class CoreDataManager {
    
    
    static let shared = CoreDataManager(moc: NSManagedObjectContext.current)
    
    var moc: NSManagedObjectContext
    
    private init(moc: NSManagedObjectContext) {
        self.moc = moc
    }
    
    func saveData(game: Game) {
        let _game = GamesDB(context: self.moc)
        _game.id = Int32(game.id)
        _game.name = game.name
        _game.released = game.released
        _game.rating = game.rating
        _game.image = game.backgroundImage
        
        do {
            try self.moc.save()
        } catch let error as NSError {
            print("Error Save DB \(error)")
        }
    }
    
    func getAllData() -> [Game] {
        
        let fetchRequest = NSFetchRequest<GamesDB>(entityName: "GamesDB")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try self.moc.fetch(fetchRequest)
            var games: [Game] = []
            
            for result in results {
                let game = Game(id: Int(result.value(forKey: "id") as? Int32 ?? 0),
                                slug: "",
                                name: result.value(forKey: "name") as? String ?? "",
                                released: result.value(forKey: "released") as? String ?? "",
                                backgroundImage: result.value(forKey: "image") as? String ?? "",
                                rating: result.value(forKey: "rating") as? Double ?? 0.0,
                                tags: [],
                                genres: [])
                games.append(game)
            }
            return games
        } catch let error as NSError {
            print("Error Get All Data \(error)")
            return []
        }
    }
    
    func getDatabyID(id: Int) -> Game? {
        
        let request = NSFetchRequest<GamesDB>(entityName: "GamesDB")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "id == %i", id)
        
        do {
            let results = try self.moc.fetch(request)
            var games: [Game] = []
            
            for result in results {
                let game = Game(id: Int(result.value(forKey: "id") as? Int32 ?? 0),
                                slug: "",
                                name: result.value(forKey: "name") as? String ?? "",
                                released: result.value(forKey: "released") as? String ?? "",
                                backgroundImage: result.value(forKey: "image") as? String ?? "",
                                rating: result.value(forKey: "rating") as? Double ?? 0.0,
                                tags: [],
                                genres: [])
                games.append(game)
            }
            return games.first
        } catch let error as NSError {
            print("Error Get Data \(error)")
            return nil
        }
    }
    
    private func getOneData(id: Int) -> GamesDB? {
        
        var result = [GamesDB]()
        
        let request = NSFetchRequest<GamesDB>(entityName: "GamesDB")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "id == %i", id)
        
        do {
            result = try self.moc.fetch(request)

        } catch let error as NSError {
            print("Error Get Data \(error)")
        }
        
        return result.first
    }
    
    func deleteData(id: Int) {
        do {
            if let result = getOneData(id: id) {
                self.moc.delete(result)
                try self.moc.save()
            }
        } catch let error as NSError {
            print("Error Delete Data \(error)")
        }
    }
    
}
