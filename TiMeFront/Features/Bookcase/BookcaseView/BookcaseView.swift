//
//  BookcaseView.swift
//  TiMeFront
//
//  Created by Thibault on 25/09/2025.
//

import SwiftUI

@available(iOS 26.0, *)
struct BookcaseView: View {
    @State private var viewModel = BookcaseViewModel()
    
    var body: some View {
        ZStack {
                // Fond de la bibliothèque
            BookcaseBackgroundView()
            
                // Scroll horizontal des étagères
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: 0) {
                    ForEach(viewModel.monthsData) { monthData in
                        VStack(spacing: 40) {
                            MonthShelfView(monthData: monthData)
                        }
                        .containerRelativeFrame(.horizontal)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
        .navigationTitle("Ma bibliothèque")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        let previewBookColor: BookColor = .purple

        if #available(iOS 26.0, *) {
            BookcaseView()
        }
    }
}
