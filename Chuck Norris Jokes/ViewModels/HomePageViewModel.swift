//
//  HomePageViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//

import Foundation

class HomePageViewModel: ObservableObject{
    @Published var joke: JokesModel?
    @Published var favouriteJokes: [JokesModel] = []
    let networkManager = NetworkManager<JokesModel>(requestType: .random)
    let userDefaultsManager = UserDefaultsManager.shared
    
    func fetchRandomQuotes(){
        networkManager.makeRequest { result in
            switch result {
            case .success(let joke):
                self.joke = joke
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func addToFavorites(_ fact: JokesModel) {
            favouriteJokes.append(fact)
            saveFavorites()
        }

        func removeFromFavorites(_ fact: JokesModel) {
            favouriteJokes.removeAll { $0.id == fact.id }
            saveFavorites()
        }

        func isFavorite(_ fact: JokesModel) -> Bool {
            return favouriteJokes.contains { $0.id == fact.id }
        }

        private func saveFavorites() {
            userDefaultsManager.save(favouriteJokes, forKey: "favouriteJokes")
        }

        private func loadFavorites() {
            if let favorites: [JokesModel] = userDefaultsManager.load(forKey: "favouriteJokes", as: [JokesModel].self) {
                favouriteJokes = favorites
            }
        }
}
