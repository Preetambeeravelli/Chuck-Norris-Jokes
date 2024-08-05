//
//  SearchButtonView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 8/2/24.
//

import SwiftUI

struct SearchButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Image(systemName: systemImageNames.magnifyingGlass.rawValue)
            .resizable()
            .frame(width: 20, height: 20)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
            )
            .tint(colorScheme == .dark ? .white : .black)
    }
}

#Preview {
    SearchButtonView()
}
