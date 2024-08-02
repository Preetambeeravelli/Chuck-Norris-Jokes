//
//  FavouritesPage.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/21/24.
//

import SwiftUI

struct FavouritesPage: View {
    @ObservedObject var vm = FavouritesPageViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                List {
                    ForEach(vm.favouriteJokes) { favJoke in
                        NavigationLink {
                            FavouriteDetalPageView(viewModel: FavouritesDetailPageViewModel(favJokeModel: favJoke))
                                .toolbarRole(.editor)
                        } label: {
                            FavouritePageRow(joke: favJoke.value)
                                .frame(height: geometry.size.height / 4)
                        }
                    }
                    .listRowSeparator(.hidden)
                }
                .scrollIndicators(.hidden)
                .listStyle(PlainListStyle())
                .refreshable {
                    vm.loadFavorites()
                }
            }
            .navigationTitle(NavigationTitles.favourites.rawValue)
            .onAppear{
                vm.loadFavorites()
            }
        }
        .tint(colorScheme == .dark ? Color.white : Color.black)
    }
}

#Preview {
    FavouritesPage()
}
