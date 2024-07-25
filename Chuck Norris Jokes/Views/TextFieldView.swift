//
//  TextFieldView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var searchText:String
    @Environment(\.colorScheme) var colorScheme
    let buttonAction: () -> Void
    var body: some View {
        HStack{
            TextField("Search Norris Here", text: $searchText)
                .padding()
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
                )
            Button(action: {
                buttonAction()
            }, label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                    )
            })
        }
        .tint(colorScheme == .dark ? Color.white : Color.black)
    }
}

#Preview {
    TextFieldView(searchText: .constant(""), buttonAction: {print("Search Tapped")})
}
