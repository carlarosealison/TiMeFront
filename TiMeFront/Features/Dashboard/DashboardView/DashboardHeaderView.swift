//
//  DashboardHeaderView.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI

struct DashboardHeaderView: View {
    @Environment(AuthViewModel.self) var authVM
    let userImageURL: String? = nil
    @State private var currentDate = Date()
    
    var body: some View {
        HStack {
            ProfileImageView()
            
            VStack(alignment: .leading) {
                if let user = authVM.currentUser {
                    Text("Bonjour \(user.firstName)")
                        .semiBoldCardsTitle()
                } else {
                    Text("invité")
                        .semiBoldCardsTitle()
                }
                
                Text(currentDate.formatted(.dateTime
                    .weekday(.wide)
                    .day()
                    .month(.wide)
                    .year()
                    .locale(Locale(identifier: "fr_FR"))
                ))
                .subTitle()
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
            .environment(AuthViewModel())
            .background(Color(UIColor.systemBackground))
    }
