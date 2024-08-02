//
//  HomePage.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//

import SwiftUI

struct HomePage: View {
    @StateObject var homePageVM = HomePageViewModel()
    @Environment(\.colorScheme) var colorScheme
//    @State var selectedCategory: String? = nil
    
    var body: some View {
        VStack{
            VStack(spacing: 0){
                Text(Apptexts.randomJoke.rawValue)
                    .font(.system(size: 36, weight: .heavy, design: .monospaced))
                CategoriesScrollView(selectedCategory: $homePageVM.selectedCategory)
                RoundedRectangle(cornerRadius: 10)
                    .stroke(lineWidth: 2)
                    .overlay {
                        if let joke = homePageVM.joke {
                            switch homePageVM.isLoading{
                            case false:
                                Text("\(joke.value.capitalized)")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 36, weight: .semibold, design: .monospaced))
                                    .minimumScaleFactor(0.6)
                                    .frame(alignment: .leading)
                                    .padding()
                            case true:
                                ProgressView()
                            }
                            
                        }
                    }
            }
            HStack {
                Button(action: {
                    homePageVM.fetchRandomQuotes()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: 70, alignment: .center)
                        Text(Apptexts.refresh.rawValue)
                            .font(.system(size: 24, weight: .bold, design: .monospaced))
                    }
                })
                
                Button(action: {
                    if let joke = homePageVM.joke {
                        if homePageVM.isFavorite(joke) {
                            homePageVM.removeFromFavorites(joke)
                        } else {
                            homePageVM.addToFavorites(joke)
                        }
                    }
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
                            .frame(height: 70)
                        Image(systemName: homePageVM.joke.flatMap { homePageVM.isFavorite($0) } == true ? systemImageNames.heartFill.rawValue : systemImageNames.heart.rawValue)
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                })
            }
            .tint(colorScheme == .dark ? Color.white : Color.black)
        }
        .padding([.top, .horizontal])
        .onAppear {
            if !homePageVM.hasFetched {
                homePageVM.fetchRandomQuotes()
                homePageVM.hasFetched = true
            }
        }
        .onChange(of: homePageVM.selectedCategory) {
            homePageVM.fetchRandomQuotesWith(category: homePageVM.selectedCategory)
        }
    }
}

#Preview {
    HomePage()
}
