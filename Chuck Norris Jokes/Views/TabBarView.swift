//
//  TabBarView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 5/21/24.
//

import SwiftUI

struct TabBarView: View {
    @Binding var currentTab: Tab

    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 30)
                .stroke(lineWidth: 2)
                .frame(height: 60, alignment: .center)
                .overlay {
                    
                    HStack {
                        ForEach(Tab.allCases, id: \.self) { tab in
                            Spacer()
                            Image(systemName: tab.rawValue)
                                .font(.title2)
                                .scaleEffect(currentTab == tab ? 1.35 : 1)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        currentTab = tab
                                    }
                                }
                            Spacer()
                        }
                    }
                }
        }
        .padding(.horizontal)
    }
}

extension TabBarView{
    private var fillImage: String{
        return currentTab.rawValue + ".fill"
    }
}

#Preview {
    TabBarView(currentTab: .constant(Tab.house))
}
