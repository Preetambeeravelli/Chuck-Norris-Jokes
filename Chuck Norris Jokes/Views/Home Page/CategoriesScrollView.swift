//
//  CategoriesScrollView.swift
//  Chuck Norris Jokes
//
//  Created by Preetam Beeravelli on 7/25/24.
//

import SwiftUI

struct CategoriesScrollView: View {
    @StateObject var categoriesViewModel = CategoriesViewModel()
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedCategory: String?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(categoriesViewModel.allCategories, id: \.self) { category in
                    VStack {
                        Text(category)
                            .font(.system(size: 18, weight: .semibold, design: .monospaced))
                            .underline(selectedCategory == category, color: colorScheme == .dark ? Color.white : Color.black)
                            .padding()
                    }
                    .background(
                        Capsule()
                            .stroke(lineWidth: 2)
                    )
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            if selectedCategory == category{
                                selectedCategory = nil
                            }else{
                                selectedCategory = category
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                categoriesViewModel.fetchCategories()
            }
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    CategoriesScrollView(selectedCategory: .constant("animal"))
        .previewLayout(.sizeThatFits)
}
