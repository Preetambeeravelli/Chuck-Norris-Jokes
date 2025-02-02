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
    
    var body: some View {
        
        switch homePageVM.errorOccured{
        case true:
            AlertView(title: "Norris is Busy") {
                homePageVM.fetchAppropriateQuote()
            }
        case false:
            VStack{
                VStack(spacing: 0){
                        Text(Apptexts.randomJoke.rawValue)
                            .font(.largeTitle)
                            .fontWeight(.bold)
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
                                        .minimumScaleFactor(0.4)
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
                        homePageVM.fetchAppropriateQuote()
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
                            Image(systemName: homePageVM.getImageName())
                                .font(.title)
                                .fontWeight(.semibold)
                        }
                    })
                }
                .tint(colorScheme == .dark ? .white : .black)
            }
            .padding([.top, .horizontal])
            .onAppear {
                if !homePageVM.hasFetched {
                    homePageVM.fetchAppropriateQuote()
                    homePageVM.hasFetched = true
                }
            }
            .onChange(of: homePageVM.selectedCategory) {
                homePageVM.fetchAppropriateQuote()
            }
        }
       
    }
}

#Preview {
    HomePage()
}
