//
//  ProfileImageView.swift
//  TiMeFront
//
//  Created by Thibault on 26/09/2025.
//

import SwiftUI

struct ProfileImageView: View {
    let imageURL: String?
    let size: CGFloat = 44
    
    var body: some View {
        Group {
            if imageURL != nil && !imageURL!.isEmpty {
                AsyncImage(url: URL(string: imageURL!)) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
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
    ProfileImageView(imageURL: "")
}
