//
//  AlertView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import SwiftUI

struct AlertView: View {
    var title: String
    var message: String?
    var dismissAction: () -> Void
    
    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.system(size: 36, weight: .heavy, design: .monospaced))
                .minimumScaleFactor(0.7)
            if message != nil{
                Text(message ?? "")
                    .font(.system(size: 24, weight: .heavy, design: .monospaced))
            }
            Button(action: {
                dismissAction()
            }, label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 2)
                        .frame(width: UIScreen.main.bounds.width / 4, height: 70, alignment: .center)
                    Text("OK")
                        .font(.system(size: 24, weight: .bold, design: .monospaced))
                }
            }).tint(Color.black)
                
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20).stroke(lineWidth: 2))
    }
}


#Preview {
    AlertView(title: "Norris is Busy", message: "Please try again later", dismissAction: {print("Button Tapped")})
//    AlertView(title: "Norris is Busy", dismissAction: {print("Button Tapped")})
}
