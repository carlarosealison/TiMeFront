//
//  PrivateJournalWeekView.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import SwiftUI

struct PrivateJournalWeekView: View {
    
    let weekNumber: Int
    let month: Int
    let year: Int
    
    @State private var viewModel: PrivateJournalViewModel
    @State private var currentDayIndex: Int = 0
    
    init(weekNumber: Int, month: Int, year: Int) {
        self.weekNumber = weekNumber
        self.month = month
        self.year = year
        
        // Initialise le ViewModel avec les paramètres
        _viewModel = State(initialValue: PrivateJournalViewModel(
            weekNumber: weekNumber,
            month: month,
            year: year
        ))
    }
    
    private var currentDayEntry: DayEntry? {
        viewModel.week?.days[safe: currentDayIndex]
    }
    
    private var currentDate: Date {
        currentDayEntry?.date ?? Date()
    }
    
    private var navigationTitleText: String {
        currentDate.formattedFrench()
    }
    
    var body: some View {
        ZStack {
            // Image du livre
            Image("Journal")
                .resizable()
                .scaledToFit()
                .frame(width: 755, height: 620)
                .padding(.leading, 360)
                .padding(.top, 20)
            
            // Contenu du journal
            VStack {
                if viewModel.isLoading {
                    ProgressView("Chargement...")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let errorMessage = viewModel.errorMessage {
                    Text("Erreur : \(errorMessage)")
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else if let dayEntry = currentDayEntry {
                    if dayEntry.hasData {
                        // Affiche les données du jour
                        PrivateJournalDayView(dayEntry: dayEntry)
                            .frame(width: 350)
                            .padding(.top, 50)
                            .padding(.leading, 30)
                    } else {
                        // Jour vide
                        EmptyStateView(date: dayEntry.date) {
                            // TODO: Navigation vers CreateJournalEntryView
                            print("Créer une entrée pour le \(dayEntry.date.formattedFrench())")
                        }
                        .frame(width: 350)
                        .padding(.top, 50)
                        .padding(.leading, 30)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .background {
            Image("BackgroundDots")
                .resizable()
                .scaledToFill()
                .scaleEffect(0.40)
                .ignoresSafeArea()
        }
        .navigationTitle(navigationTitleText)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            // Navigation entre les jours
            ToolbarItemGroup(placement: .bottomBar) {
                Button(action: previousDay) {
                    Image(systemName: "chevron.left")
                }
                .disabled(currentDayIndex == 0)
                
                Spacer()
                
                Text("Jour \(currentDayIndex + 1)/7")
                    .font(.caption)
                    .foregroundStyle(Color("PurpleText"))
                
                Spacer()
                
                Button(action: nextDay) {
                    Image(systemName: "chevron.right")
                }
                .disabled(currentDayIndex == 6)
            }
        }
        .task {
            // Charge les données au chargement de la vue
            await viewModel.loadWeek()
        }
    }
    
    // MARK: - Navigation
    
    private func previousDay() {
        guard currentDayIndex > 0 else { return }
        withAnimation {
            currentDayIndex -= 1
        }
    }
    
    private func nextDay() {
        guard currentDayIndex < 6 else { return }
        withAnimation {
            currentDayIndex += 1
        }
    }
}

// Extension pour accès sécurisé aux tableaux
extension Array {
    subscript(safe index: Int) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

#Preview {
    NavigationStack {
        PrivateJournalWeekView(
            weekNumber: 2,
            month: 10,
            year: 2025
        )
    }
}
