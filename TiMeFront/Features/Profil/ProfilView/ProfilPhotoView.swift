//
//  ProfilPhotoView.swift
//  TiMeFront
//
//  Created by Mounir on 13/10/2025.
//

import SwiftUI

struct ProfilePhotoView: View {
    @Bindable var viewModel: ProfilViewModel
    
    var body: some View {
        VStack {
            if let image = viewModel.profilImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 200, height: 200)
            } else {
                Image(systemName: "person.fill")
                    .font(.system(size: 80))
                    .foregroundColor(Color("PurpleText"))
            }
            
            Button("Changer la photo") {
                // Vous pouvez réutiliser PhotosPicker ici aussi
            }
            .padding()
        }
        .navigationTitle("Photo de profil")
    }
}

#Preview {
    ProfilePhotoView(viewModel: ProfilViewModel())
}
