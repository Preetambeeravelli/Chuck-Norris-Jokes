//
//  SearchViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import Foundation
import SwiftUI

@MainActor
class SearchViewModel: ObservableObject{
    @Published var searchText: String = ""
    @Published var hasError: Bool = false
    @Published var searchResults: [JokesModel] = []
    
    func fetchQuotesWithSearchText(searchText: String){
        let networkManager = NetworkManager<SearchJokeModel>(requestType: .query(searchText))
        networkManager.makeRequest { [self] result in
            switch result {
            case .success(let jokes):
                DispatchQueue.main.async{
                    self.searchResults = jokes.result
                }
            case .failure(let error):
                print("Error: \(error)")
                changeErrorStatus()
            }
        }
    }
}

extension SearchViewModel{
    func emptySearchText(){
        self.searchText = ""
    }
    
    func changeErrorStatus(){
        self.hasError.toggle()
    }
}
