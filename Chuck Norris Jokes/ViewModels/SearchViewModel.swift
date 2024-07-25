//
//  SearchViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import Foundation

class SearchViewModel: ObservableObject{
    @Published var searchResults: [JokesModel] = []
    
    func fetchQuotesWithSearchText(searchText: String){
        let networkManager = NetworkManager<SearchJokeModel>(requestType: .query(searchText))
        networkManager.makeRequest { result in
            switch result {
            case .success(let jokes):
                DispatchQueue.main.async{
                    self.searchResults = jokes.result
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
    
}
