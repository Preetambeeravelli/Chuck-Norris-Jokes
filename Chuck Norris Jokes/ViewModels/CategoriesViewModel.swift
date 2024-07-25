//
//  CategoriesViewModel.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    @Published var allCategories: [String] = []
    let networkManager = NetworkManager<[String]>(requestType: .allCategories)
    
    func fetchCategories() {
        networkManager.makeRequest { result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async {
                    self.allCategories = categories.map { $0.capitalized } // Ensure categories are capitalized
                }
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
