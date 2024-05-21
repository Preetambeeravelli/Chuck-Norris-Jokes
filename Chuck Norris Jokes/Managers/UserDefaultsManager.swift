//
//  UserDefaultsManager.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let favoritesKey = "favoriteJokes"
    
    private init() {}
    
    func save<T: Codable>(_ object: T, forKey key: String) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    func load<T: Codable>(forKey key: String, as type: T.Type) -> T? {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            return try? decoder.decode(T.self, from: savedData)
        }
        return nil
    }
}

extension UserDefaultsManager{
    func saveFavorites(_ jokes: [JokesModel]) {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(jokes) {
                UserDefaults.standard.set(encoded, forKey: favoritesKey)
            }
        }
        
        func loadFavorites() -> [JokesModel] {
            if let savedData = UserDefaults.standard.data(forKey: favoritesKey) {
                let decoder = JSONDecoder()
                return (try? decoder.decode([JokesModel].self, from: savedData)) ?? []
            }
            return []
        }
        
        func addToFavorites(_ joke: JokesModel) {
            var currentFavorites = loadFavorites()
            if !currentFavorites.contains(where: { $0.id == joke.id }) {
                currentFavorites.append(joke)
                saveFavorites(currentFavorites)
            }
        }
        
        func removeFromFavorites(_ joke: JokesModel) {
            var currentFavorites = loadFavorites()
            currentFavorites.removeAll { $0.id == joke.id }
            saveFavorites(currentFavorites)
        }
        
        func isFavorite(_ joke: JokesModel) -> Bool {
            let currentFavorites = loadFavorites()
            return currentFavorites.contains { $0.id == joke.id }
        }
}
