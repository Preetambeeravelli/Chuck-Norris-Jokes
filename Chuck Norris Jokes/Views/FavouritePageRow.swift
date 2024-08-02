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
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .stroke(lineWidth: 2)
                .overlay {
                    Text("\(joke.capitalized)")
                        .font(.system(.body, design: .monospaced))
                        .multilineTextAlignment(.leading)
                        .minimumScaleFactor(0.6)
                        .padding()
                }
        }
    }
}

#Preview {
    FavouritePageRow(joke: "djsyfgdhjsbfgdhjksbcfdhjksfgdhjsfgjkdhsfgdjshfgdhjksgfhjdsgfhjdsgfjhdsgfhjkdsgfjhdsbvcjbsdaiuydrfgheajsubfhuydes fuyg adsjhbf dhjszkbcf adsuyf dsjkyf gjdhksgf jnds fchjdsgf jhadsfg jkadsh dcfmaszhbd cjashdajks dcgjkhas ")
}
