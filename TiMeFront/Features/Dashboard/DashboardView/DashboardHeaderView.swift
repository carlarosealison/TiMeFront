struct DashboardHeaderView: View {
    // Pour l'instant nil, plus tard depuis la DB
    let userImageURL: String? = nil  
    
    var body: some View {
        HStack {
            // ✅ Fonctionne maintenant avec le SF Symbol
            // ✅ Fonctionnera plus tard avec l'URL
            ProfileImageView(
                imageURL: userImageURL,
                size: 44
            )
            
            VStack(alignment: .leading) {
                Text("Bonjour Tipsy")
                Text("Mercredi 3 septembre 2025")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
    }
}