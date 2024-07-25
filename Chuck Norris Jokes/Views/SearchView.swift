//
//  SearchView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import SwiftUI

struct SearchView: View {
    @State var searchText: String = ""
    @StateObject var vm = SearchViewModel()
    var body: some View {
        NavigationStack {
            VStack{
                TextFieldView(searchText: $searchText) {
                    vm.fetchQuotesWithSearchText(searchText: searchText)
                    searchText = ""
                }
                GeometryReader{ geometry in
                    List {
                        ForEach(vm.searchResults) { favJoke in
                            NavigationLink {
                                FavouriteDetalPageView(viewModel: FavouritesDetailPageViewModel(favJokeModel: favJoke))
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
                .navigationTitle("Search Norris")
            }
        }
    }
}

#Preview {
    SearchView()
}
