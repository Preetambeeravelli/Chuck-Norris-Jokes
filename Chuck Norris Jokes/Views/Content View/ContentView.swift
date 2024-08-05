//
//  ContentView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/20/24.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    HomePage().tag(Tab.house)
                    FavouritesPage().tag(Tab.heart)
                    SearchView().tag(Tab.magnifyingglass)
                }
                VStack {
                    TabBarView(currentTab: $tabSelected)
                        .padding(.bottom, 10)
                }
                .padding(.top, 2)
            }
        }
    }
}

#Preview {
    ContentView()
}
