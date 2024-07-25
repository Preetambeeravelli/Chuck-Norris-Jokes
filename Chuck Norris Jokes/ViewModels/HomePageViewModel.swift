//
//  HomePageViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//

import Foundation

@MainActor
class HomePageViewModel: ObservableObject{
    @Published var joke: JokesModel?
    @Published var favouriteJokes: [JokesModel] = []
    @Published var isLoading: Bool = false
    let networkManager = NetworkManager<JokesModel>(requestType: .random)
    let userDefaultsManager = UserDefaultsManager.shared
    
    init() {
            loadFavorites()
        }
    
    func fetchRandomQuotes(){
        isLoading = true
        networkManager.makeRequest { result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async{
                    self.joke = joke
                    self.isLoading = false
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
    func fetchRandomQuotesWith(category: String?){
        guard let category = category else {return}
        let networkManager2 = NetworkManager<JokesModel>(requestType: .categorySearch(category.lowercased()))
        networkManager2.makeRequest { result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async{
                    self.joke = joke
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    func addToFavorites(_ joke: JokesModel) {
        userDefaultsManager.addToFavorites(joke)
        loadFavorites()
    }
    
    func removeFromFavorites(_ joke: JokesModel) {
        userDefaultsManager.removeFromFavorites(joke)
        loadFavorites()
    }
    
    func isFavorite(_ joke: JokesModel) -> Bool {
        return userDefaultsManager.isFavorite(joke)
    }
    
    private func loadFavorites() {
        favouriteJokes = userDefaultsManager.loadFavorites()
    }

}
