//
//  NoFavPresentView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 8/5/24.
//

import SwiftUI

struct NoFavPresentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("OOPS!!")
                .font(.largeTitle)
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .foregroundStyle(Color.red)
            Text("You didn't seem to like Chuck Norris Jokes")
                .font(.title)
                .fontDesign(.monospaced)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(
        RoundedRectangle(cornerRadius: 20)
            .stroke(lineWidth: 2)
        )
    }
}

#Preview {
    NoFavPresentView()
}
