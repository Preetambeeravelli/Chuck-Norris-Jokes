//
//  TextFieldView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var searchText:String
    let buttonAction: () -> Void
    
    var body: some View {
        HStack{
            TextField(TextFieldTexts.searchNorrisHere.rawValue, text: $searchText)
                .padding()
                .background(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 2)
                )
            Button(action: {
                buttonAction()
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
