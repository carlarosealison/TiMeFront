    //
    //  BookcaseView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 01/11/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
struct BookcaseView: View {
    @State private var viewModel = BookcaseViewModel()
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                VStack(spacing: 40) {
                    JanuaryShelfView(year: viewModel.currentYear)
                    FebruaryShelfView(year: viewModel.currentYear)
                }
                .containerRelativeFrame(.horizontal)
                
                VStack(spacing: 40) {
                    MarchShelfView(year: viewModel.currentYear)
                    AprilShelfView(year: viewModel.currentYear)
                }
                .containerRelativeFrame(.horizontal)
                
                VStack(spacing: 40) {
                    MayShelfView(year: viewModel.currentYear)
                    JuneShelfView(year: viewModel.currentYear)
                }
                .containerRelativeFrame(.horizontal)
                
                VStack(spacing: 40) {
                    JulyShelfView(year: viewModel.currentYear)
                    AugustShelfView(year: viewModel.currentYear)
                }
                .containerRelativeFrame(.horizontal)
                
                VStack(spacing: 40) {
                    SeptemberShelfView(year: viewModel.currentYear)
                    OctoberShelfView(year: viewModel.currentYear)
                }
                .containerRelativeFrame(.horizontal)
                
                VStack(spacing: 40) {
                    NovemberShelfView(year: viewModel.currentYear)
                    DecemberShelfView(year: viewModel.currentYear)
                }
                .containerRelativeFrame(.horizontal)
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .navigationTitle("Ma bibliothèque")
        .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        NavigationStack {
            BookcaseView()
                .environment(AuthViewModel())
        }
    }
}
