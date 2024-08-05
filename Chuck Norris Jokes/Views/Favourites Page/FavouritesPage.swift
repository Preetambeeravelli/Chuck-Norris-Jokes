//
//  FavouritesPage.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/21/24.
//

import SwiftUI

struct FavouritesPage: View {
    @StateObject var vm = FavouritesPageViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            switch vm.hasFav{
            case true:
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
                    .onAppear{
                        vm.loadFavorites()
                    }
                    .refreshable {
                        vm.loadFavorites()
                    }
                }
                .navigationTitle(NavigationTitles.favourites.rawValue)
            case false:
                NoFavPresentView()
                .navigationTitle(NavigationTitles.favourites.rawValue)
            }
                
        }
        .onAppear{
            vm.loadFavorites()
        }
        .tint(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    FavouritesPage()
}
