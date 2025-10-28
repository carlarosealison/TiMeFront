//
//  PrivateJournalWeekView.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import SwiftUI

@available(iOS 26.0, *)
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
        
        _viewModel = State(initialValue: PrivateJournalViewModel(
            weekNumber: weekNumber,
            month: month,
            year: year
        ))
    }
    
    // Nombre de jours dans cette semaine (peut être < 7)
    private var totalDays: Int {
        viewModel.week?.days.count ?? 0
    }
    
    private var currentDayEntry: DayEntry? {
        viewModel.week?.days[safe: currentDayIndex]
    }
    
    private var navigationTitleText: String {
        guard let week = viewModel.week,
              currentDayIndex < week.days.count else {
            return "Chargement..."
        }
        return week.days[currentDayIndex].date.formattedFrench()
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
							// Au moins 1 donnée → Affiche placeholders pour les autres cartes
						PrivateJournalDayView(dayEntry: dayEntry)
							.frame(width: 350)
							.padding(.top, 50)
							.padding(.leading, 30)
					} else {
							// Aucune donnée → Affiche EmptyStateView
						EmptyStateView(date: dayEntry.date)
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
                    .navigationBarTitleDisplayMode(.automatic)
                    .toolbar {
                        // Navigation entre les jours
                        ToolbarItemGroup(placement: .bottomBar) {
                            Button(action: previousDay) {
                                Image(systemName: "chevron.left")
                            }
                            .disabled(currentDayIndex == 0)
                            
                            Spacer()
                            
                            // Affiche "Jour X/Y" où Y est le nombre réel de jours
                            Text("Jour \(currentDayIndex + 1)/\(totalDays)")
                                .font(.caption)
                                .foregroundStyle(Color("PurpleText"))
                            
                            Spacer()
                            
                            Button(action: nextDay) {
                                Image(systemName: "chevron.right")
                            }
                            .disabled(currentDayIndex >= totalDays - 1) // Désactive si on est au dernier jour
                        }
                    }
                    .task {
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
                guard currentDayIndex < totalDays - 1 else { return }
                withAnimation {
                    currentDayIndex += 1
                }
            }
        }

#Preview {
    NavigationStack {
        if #available(iOS 26.0, *) {
            PrivateJournalWeekView(
                weekNumber: 5,
                month: 10,
                year: 2025
            )
        }
    }
}
