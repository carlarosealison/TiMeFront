//
//  BookcaseView.swift
//  TiMeFront
//
//  Created by Thibault on 25/09/2025.
//

import SwiftUI

struct BookcaseView: View {
    
    // Récupère le mois et l'année actuels pour créer 1 mois avec 4 semaines (4 livres)
    private var currentMonth: Int {
        Calendar.current.component(.month, from: Date())
    }
    
    private var currentYear: Int {
        Calendar.current.component(.year, from: Date())
    }
    
    //TODO: Modifier les livres car c'est en dur pour PrivateJournalView
    var body: some View {
        HStack(spacing: 20) {
            // Livre Semaine 1
            NavigationLink {
                PrivateJournalWeekView(
                    weekNumber: 1,
                    month: currentMonth,
                    year: currentYear
                )
            } label: {
                Image("PurpleBook")
                    .resizable()
                    .scaledToFit()
            }
            
            // Livre Semaine 2
            NavigationLink {
                PrivateJournalWeekView(
                    weekNumber: 2,
                    month: currentMonth,
                    year: currentYear
                )
            } label: {
                Image("PurpleBook")
                    .resizable()
                    .scaledToFit()
            }
            
            // Livre Semaine 3
            NavigationLink {
                PrivateJournalWeekView(
                    weekNumber: 3,
                    month: currentMonth,
                    year: currentYear
                )
            } label: {
                Image("PurpleBook")
                    .resizable()
                    .scaledToFit()
            }
            
            // Livre Semaine 4
            NavigationLink {
                PrivateJournalWeekView(
                    weekNumber: 4,
                    month: currentMonth,
                    year: currentYear
                )
            } label: {
                Image("PurpleBook")
                    .resizable()
                    .scaledToFit()
            }
        }
        .padding()
    }
}

#Preview {
    NavigationStack {
        BookcaseView()
    }
}
