//
//  HomePageViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//

import Foundation
import SwiftUI

@MainActor
class HomePageViewModel: ObservableObject{
    
    @Published var hasFetched = false
    @Published var selectedCategory: String? = nil
    
    @Published var joke: JokesModel?
    @Published var favouriteJokes: [JokesModel] = []
    @Published var isLoading: Bool = false
    
    @Published var errorOccured = false
    
    let userDefaultsManager = UserDefaultsManager.shared
    let networkManager = NetworkManager<JokesModel>(requestType: .random)
    
    init() {
        loadFavorites()
    }
    
    private func fetchRandomQuotes(){
        networkManager.makeRequest { [self] result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async{
                    self.joke = joke
                    self.isLoading = false
                    self.errorOccured = false
                }
            case .failure(_):
                errorOccured = true
            }
        }
    }
    
    private func fetchRandomQuotesWith(category: String?){
        guard let category = category else {return}
        let networkManager2 = NetworkManager<JokesModel>(requestType: .categorySearch(category.lowercased()))
        networkManager2.makeRequest { [self] result in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async{
                    self.joke = joke
                    self.isLoading = false
                    self.errorOccured = false
                }
            case .failure(_):
                errorOccured = true
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

extension HomePageViewModel{
    func fetchAppropriateQuote(){
        isLoading = true
        switch selectedCategory{
        case .none:
            fetchRandomQuotes()
        case .some(let category):
            fetchRandomQuotesWith(category: category)
        }
    }
}

extension HomePageViewModel{
    func getImageName() -> String{
        joke.flatMap { isFavorite($0) } == true ? systemImageNames.heartFill.rawValue : systemImageNames.heart.rawValue
    }
    
    func toggleError(){
        errorOccured.toggle()
    }
}
