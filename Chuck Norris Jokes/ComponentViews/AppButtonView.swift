//
//  AppButtonView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 8/2/24.
//

import SwiftUI

struct AppButtonView: View {
    @Environment(\.colorScheme) var colorScheme
    var buttonImage: ButtonImage
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .frame(height: 70)
            Image(systemName: buttonImage.rawValue)
                .font(.title)
                .fontWeight(.semibold)
        }
        .tint(colorScheme == .dark ? Color.white : Color.black)
    }
}

#Preview {
    AppButtonView(buttonImage: .share)
}
