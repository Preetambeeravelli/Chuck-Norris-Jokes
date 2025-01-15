//
//  Constants.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 8/2/24.
//

import Foundation

enum NavigationTitles: String{
    case searchPage = "Search Norris"
    case favourite = "Favourite"
    case favourites = "Favourites"
}

enum TextFieldTexts: String{
    case searchNorrisHere = "Search Norris Here"
}

enum systemImageNames: String{
    case magnifyingGlass = "magnifyingglass"
    case heartFill = "heart.fill"
    case heart
}

enum ButtonImage: String{
    case share = "square.and.arrow.up"
    case heart = "heart"
    case heartFill = "heart.fill"
}

enum Tab: String, CaseIterable{
    case house, heart, magnifyingglass = "magnifyingglass.circle"
    var fillImageName: String{
        self.rawValue + ".fill"
    }
}

enum Apptexts: String{
    case randomJoke = "Random Chuck"
    case refresh = "New Chuck"
}
