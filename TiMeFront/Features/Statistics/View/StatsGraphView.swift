//
//  StatsGraphView.swift
//  TiMeFront
//
//  Created by Thibault on 02/10/2025.
//

import SwiftUI

struct StatsGraphView: View {
    
    @State private var currentPage = 0
    let graphs: [[MoodBar]] = [
        // Graph 1
        [
            MoodBar(filledBars: 8, color: .mint),
            MoodBar(filledBars: 4, color: .red),
            MoodBar(filledBars: 2, color: Color(red: 0.7, green: 0.6, blue: 0.9)),
            MoodBar(filledBars: 7, color: .green),
            MoodBar(filledBars: 5, color: .pink),
            MoodBar(filledBars: 4, color: .orange),
            MoodBar(filledBars: 3, color: .purple),
        ],
        // Graph 2
    ]
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(.whitePurple)
                .frame(width: .infinity, height: 270)
//                .frame(minWidth: .infinity, minHeight: 270)
            VStack {
                Text("Taux")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 38)
                
                TabView(selection: $currentPage) {
                    ForEach(0..<graphs.count, id: \.self) { index in
                        FullGraphView(moodBars: graphs[index])
                            .tag(index)
                        DonutDataCell()
                            .tag(index)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .frame(height: 180)
                
                // Indicateurs de page
                HStack(spacing: 8) {
                    ForEach(0..<graphs.count, id: \.self) { index in
                        Circle()
                            .fill(currentPage == index ? Color("PurpleDark") : Color.gray.opacity(0.3))
                            .frame(width: 8, height: 8)
                            .animation(.easeInOut, value: currentPage)
                    }
                }
                
                Text("Humeurs")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.trailing, 60)
            }
        }
        

    }
}

struct FullGraphView: View {
    let moodBars: [MoodBar]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 12) {
            // Axe Y
            VStack(alignment: .trailing, spacing: 2) {
                ForEach([100, 90, 80, 70, 60, 50, 40, 30, 20, 10], id: \.self) { value in
                    Text("\(value)")
                        .font(.caption2)
                        .foregroundStyle(.secondary)
                        
                }
            }
            
            // Graphique
            HStack(alignment: .bottom, spacing: 16) {
                ForEach(moodBars) { bar in
                    VStack(spacing: 6) {
                        ForEach((0..<11).reversed(), id: \.self) { index in
                            Capsule()
                                .fill(index < bar.filledBars ? bar.color : Color.gray.opacity(0.15))
                                .frame(width: 30, height: 8)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    StatsGraphView()
}
