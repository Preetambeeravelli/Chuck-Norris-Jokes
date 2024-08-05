//
//  FavouritePageRow.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/21/24.
//

import SwiftUI

struct FavouritePageRow: View {
    var joke: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .overlay(
                HStack(alignment: .top) {
                    Text("\(joke.capitalized)")
                        .font(.system(.body, design: .monospaced))
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    Spacer()
                }
            )
    }
}

#Preview {
    FavouritePageRow(joke: "djsyfgdhjsbfgdhjksbcfd ")
}
