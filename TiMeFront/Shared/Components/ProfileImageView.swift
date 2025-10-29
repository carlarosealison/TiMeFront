//
//  ProfileImageView.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI

struct ProfileImageView: View {
    @Environment(AuthViewModel.self) var authVM
    let size: CGFloat = 44
    
    var body: some View {
        Group {
            if let user = authVM.currentUser,
               let imageURLString = user.imageProfil,
               !imageURLString.isEmpty,
               let imageURL = URL(string: imageURLString) {
                
                AsyncImage(url: imageURL) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .foregroundColor(Color("PurpleText"))
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .foregroundColor(Color("PurpleText"))
            }
        }
                .frame(width: size, height: size)
                .clipShape(Circle())
    }
}

#Preview {
    ProfileImageView()
        .environment(AuthViewModel())
}
