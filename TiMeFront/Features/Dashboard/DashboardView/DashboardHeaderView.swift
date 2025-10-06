//
//  DashboardHeaderView.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI

struct DashboardHeaderView: View {
    let userImageURL: String? = nil
    
    var body: some View {
        HStack {
            ProfileImageView(
                imageURL: userImageURL
            )
            
            VStack(alignment: .leading) {
                Text("Bonjour Tipsy")
                
                Text("Mercredi 3 septembre 2025")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
            }
            
            Spacer()
            
            FlowerSettingsButton(action: {})
        }
        .padding()
    }
}
    
    #Preview {
        DashboardHeaderView()
            .background(Color(UIColor.systemBackground))
    }

