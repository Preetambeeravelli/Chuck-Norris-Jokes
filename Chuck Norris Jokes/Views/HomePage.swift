//
//  HomePage.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//

import SwiftUI

struct HomePage: View {
    @StateObject var homePageVM = HomePageViewModel()
    @State var hasFetched = false
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            Text("Random Joke")
                .font(.system(size: 36, weight: .heavy, design: .monospaced))
            
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .overlay {
                    if let joke = homePageVM.joke {
                        Text("\(joke.value.capitalized)")
                            .multilineTextAlignment(.leading)
                            .font(.system(size: 36, weight: .semibold, design: .monospaced))
                            .minimumScaleFactor(0.6)
                            .padding()
                    }
                }
            
            HStack {
                Button(action: {
                    homePageVM.fetchRandomQuotes()
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 2)
//                            .fill(Color.black)
                            .frame(width: UIScreen.main.bounds.width * 0.7, height: 70, alignment: .center)
                        Text("Refresh")
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
                        Image(systemName: homePageVM.joke.flatMap { homePageVM.isFavorite($0) } == true ? "heart.fill" : "heart")
                            .font(.title)
                            .fontWeight(.semibold)
//                            .foregroundColor(.black)
                    }
                })
            }
            .accentColor(colorScheme == .dark ? Color.white : Color.black)
        }
        .padding([.top, .horizontal])
        .onAppear {
            if !hasFetched {
                homePageVM.fetchRandomQuotes()
                hasFetched = true
            }
        }
    }
}

#Preview {
    HomePage()
}
