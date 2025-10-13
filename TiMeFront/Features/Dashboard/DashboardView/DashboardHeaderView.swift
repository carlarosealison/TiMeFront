//
//  DashboardHeaderView.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI

struct DashboardHeaderView: View {
    let userImageURL: String? = nil
//    @Environment(AuthManager.self) private var authManager
    @State private var currentDate = Date()
    
    var body: some View {
        HStack {
            ProfileImageView(
                imageURL: userImageURL
            )
            
            VStack(alignment: .leading) {
//                if let user = authManager.currentUser {
//                    Text("Bonjour \(user.userName)")
                
                Text(currentDate.formatted(.dateTime
                    .weekday(.wide)
                    .day()
                    .month(.wide)
                    .year()
                    .locale(Locale(identifier: "fr_FR"))
                ))
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .task {
                // Charger les infos utilisateur
//                await authManager.loadCurrentUser()
            }
            
            Spacer()
            
            NavigationLink(value: DashboardDestination.profile) {
                ZStack {
                    OrganicFlowerShape()
                        .fill(Color("PurpleText"))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundStyle(.white)
                }
            }
            .buttonStyle(.plain)
        }
        .padding()
    }
}
    
#Preview {
        DashboardHeaderView()
    }
