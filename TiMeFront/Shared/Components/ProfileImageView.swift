    //
    //  ProfileImageView.swift
    //  TiMeFront
    //

import SwiftUI

struct ProfileImageView: View {
    @Environment(AuthViewModel.self) var authVM
    
    let size: CGFloat
    
    init(size: CGFloat = 44) {
        self.size = size
    }
    
    var body: some View {
        Group {
            if let user = authVM.currentUser,
               let imageURLString = user.imageProfil,
               !imageURLString.isEmpty,
               let imageURL = URL(string: buildFullURL(from: imageURLString)) {
                
                AsyncImage(url: imageURL) { phase in
                    switch phase {
                        case .empty:
                            ProgressView()
                            
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                            
                        case .failure(let error):
                            initialsView
                                .onAppear {
                                    if let urlError = error as? URLError,
                                       urlError.code != .cancelled {
                                        print("❌ [ProfileImage] Échec: \(imageURL)")
                                        print("   Erreur: \(urlError.localizedDescription)")
                                    }
                                }
                            
                        @unknown default:
                            initialsView
                    }
                }
            } else {
                initialsView
            }
        }
        .frame(width: size, height: size)
        .clipShape(Circle())
    }
    
    private var initialsView: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            Color("PurpleButton"),
                            Color("PurpleDark")
                        ],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
            
            Text(authVM.userInitials)
                .font(.system(size: size * 0.4, weight: .bold, design: .rounded))
                .foregroundStyle(.white)
        }
    }
    
    private func buildFullURL(from urlString: String) -> String {
        if urlString.starts(with: "http://") || urlString.starts(with: "https://") {
            return urlString
        } else {
            let baseURL = APIService.shared.baseURL.absoluteString
            let cleanBase = baseURL.hasSuffix("/") ? String(baseURL.dropLast()) : baseURL
            let cleanPath = urlString.hasPrefix("/") ? String(urlString.dropFirst()) : urlString
            return "\(cleanBase)/\(cleanPath)"
        }
    }
}
