//
//  FavouriteDetalPageView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/21/24.
//

import SwiftUI

struct FavouriteDetalPageView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel: FavouritesDetailPageViewModel
    
    var body: some View {
        VStack(spacing: 10){
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .overlay {
                    Text("\(viewModel.favJokeModel.value.capitalized)")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 36, weight: .semibold, design: .monospaced))
                        .minimumScaleFactor(0.6)
                        .padding()
                }
            HStack{
                ShareLink(item: viewModel.favJokeModel.value) {
                    AppButtonView(buttonImage: .share)
                }
                Button(action: {
                    viewModel.toggleFavoriteStatus()
                }, label: {
                    AppButtonView(buttonImage: viewModel.isFavorite ? .heartFill : .heart)
                })
            }
            .tint(colorScheme == . dark ? Color.white : Color.black)
        }
        .navigationTitle(NavigationTitles.favourite.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    FavouriteDetalPageView(viewModel: FavouritesDetailPageViewModel(favJokeModel: JokesModel(id: "dssfd", value: "This is a preview", categories: [])))
}
