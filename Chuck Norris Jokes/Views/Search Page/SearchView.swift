//
//  SearchView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var searchViewModel = SearchViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack {
            ZStack {
                switch searchViewModel.hasError{
                case true:
                    AlertView(title: "Norris is Busy") {
                        searchViewModel.changeErrorStatus()
                    }
                case false:
                    VStack{
                        TextFieldView(searchText: $searchViewModel.searchText) {
                            searchViewModel.fetchQuotesWithSearchText(searchText: searchViewModel.searchText)
                            searchViewModel.emptySearchText()
                        }
                        GeometryReader{ geometry in
                            List {
                                ForEach(searchViewModel.searchResults) { favJoke in
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
                        }
                        .navigationTitle(NavigationTitles.searchPage.rawValue)
                    }
                }
            }
        }
        .tint(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    SearchView()
}
