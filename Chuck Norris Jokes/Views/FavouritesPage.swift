//
//  FavouritesPage.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/21/24.
//

import SwiftUI

struct FavouritesPage: View {
    @StateObject var vm = FavouritesPageViewModel()
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                List {
                    ForEach(vm.favouriteJokes) { favJoke in
                        FavouritePageRow(joke: favJoke.value)
                            .frame(height: geometry.size.height / 4)
                    }
                    .refreshable {
                        vm.loadFavorites()
                    }
                    .listRowSeparator(.hidden)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Favourites")
        }
        .task{
            vm.loadFavorites()
        }
    }
}

#Preview {
    FavouritesPage()
}
