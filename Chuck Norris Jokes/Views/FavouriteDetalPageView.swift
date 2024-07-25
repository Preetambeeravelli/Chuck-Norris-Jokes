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
                Button(action: {
                    ShareViewModel(text: viewModel.favJokeModel.value).shareText()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .frame(height: 70)
                        Image(systemName: "square.and.arrow.up")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                })
                Button(action: {
                    viewModel.toggleFavoriteStatus()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .frame(height: 70)
                        Image(systemName: viewModel.isFavorite ? "heart.fill" : "heart")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                })
            }
            .tint(colorScheme == . dark ? Color.white :Color.black)
        }
        .navigationTitle("Favourite")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

#Preview {
    FavouriteDetalPageView(viewModel: FavouritesDetailPageViewModel(favJokeModel: JokesModel(id: "dssfd", value: "This is a preview")))
}
