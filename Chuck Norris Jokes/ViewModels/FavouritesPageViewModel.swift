//
//  FavouritesPageViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/21/24.
//

import Foundation

class FavouritesPageViewModel: ObservableObject{
    let userDefaultsManager = UserDefaultsManager.shared
    @Published var favouriteJokes: [JokesModel] = []
    @Published var hasFav: Bool = false
    
    init(){
        loadFavorites()
    }
    
    func loadFavorites() {
        favouriteJokes = userDefaultsManager.loadFavorites()
        checkIfHasFav()
    }
}

extension FavouritesPageViewModel{
    func checkIfHasFav(){
        hasFav = !favouriteJokes.isEmpty
    }
}
