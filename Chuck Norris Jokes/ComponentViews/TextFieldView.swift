//
//  TextFieldView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var searchText:String
    @FocusState var isInputFocused: Bool
    let buttonAction: () -> Void
    
    var body: some View {
        HStack{
            TextField(TextFieldTexts.searchNorrisHere.rawValue, text: $searchText)
                .padding()
                .focused($isInputFocused)
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
                )
            Button(action: {
                buttonAction()
                isInputFocused = false
            }, label: {
                SearchButtonView()
            })
        }
        .padding(.horizontal, 10)
    }
}

#Preview {
    TextFieldView(searchText: .constant(""), buttonAction: {print("Search Tapped")})
}
