//
//  FavouritesDetailPageViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/31/24.
//

import Foundation

class FavouritesDetailPageViewModel: ObservableObject {
    @Published var favJokeModel: JokesModel
    @Published var isFavorite: Bool
    
    let userDefaultsManager = UserDefaultsManager.shared
    
    init(favJokeModel: JokesModel) {
        self.favJokeModel = favJokeModel
        self.isFavorite = userDefaultsManager.isFavorite(favJokeModel)
    }
    
    func toggleFavoriteStatus() {
        if isFavorite {
            removeFromFavorites()
        } else {
            addToFavorites()
        }
        isFavorite.toggle()
    }
    
    private func addToFavorites() {
        userDefaultsManager.addToFavorites(favJokeModel)
    }
    
    private func removeFromFavorites() {
        userDefaultsManager.removeFromFavorites(favJokeModel)
    }
}

