//
//  EmotionListView.swift
//  TiMeFront
//
//  Created by Mounir on 28/10/2025.
//

import SwiftUI

struct EmotionListView: View {
    @State private var selectedEmotion: String? = nil  // Une seule émotion sélectionnée
    
    var body: some View {
        ZStack {
            Image("BackgroundDots")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 700)
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                HStack {
                    Text("Liste des Émotions")
                        .fontWidth(.expanded)
                        .bold()
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 44)
                .padding()
                
                VStack(alignment: .leading) {
                    
                    
                    Group {
                        Text("Amour")
                            .fontWidth(.expanded)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Excitée",
                                    isSelected: selectedEmotion == "Excitée",
                                    onTap: { selectEmotion("Excitée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Tendre",
                                    isSelected: selectedEmotion == "Tendre",
                                    onTap: { selectEmotion("Tendre") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Attentionnée",
                                    isSelected: selectedEmotion == "Attentionnée",
                                    onTap: { selectEmotion("Attentionnée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Passionnée",
                                    isSelected: selectedEmotion == "Passionnée",
                                    onTap: { selectEmotion("Passionnée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Paisible",
                                    isSelected: selectedEmotion == "Paisible",
                                    onTap: { selectEmotion("Paisible") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Affectueuse",
                                    isSelected: selectedEmotion == "Affectueuse",
                                    onTap: { selectEmotion("Affectueuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Romantique",
                                    isSelected: selectedEmotion == "Romantique",
                                    onTap: { selectEmotion("Romantique") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Amoureuse",
                                    isSelected: selectedEmotion == "Amoureuse",
                                    onTap: { selectEmotion("Amoureuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Désir",
                                    isSelected: selectedEmotion == "Désir",
                                    onTap: { selectEmotion("Désir") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rose",
                                    emotion: "Envie",
                                    isSelected: selectedEmotion == "Envie",
                                    onTap: { selectEmotion("Envie") }
                                ).frame(width: 120)
                            }
                        }
                        .background(Color.clear)
                    }
                    
                    Group {
                        Text("Joie")
                            .fontWidth(.expanded)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Fascinée",
                                    isSelected: selectedEmotion == "Fascinée",
                                    onTap: { selectEmotion("Fascinée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Optimiste",
                                    isSelected: selectedEmotion == "Optimiste",
                                    onTap: { selectEmotion("Optimiste") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Reconnaissante",
                                    isSelected: selectedEmotion == "Reconnaissante",
                                    onTap: { selectEmotion("Reconnaissante") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Fière",
                                    isSelected: selectedEmotion == "Fière",
                                    onTap: { selectEmotion("Fière") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Heureuse",
                                    isSelected: selectedEmotion == "Heureuse",
                                    onTap: { selectEmotion("Heureuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Joyeuse",
                                    isSelected: selectedEmotion == "Joyeuse",
                                    onTap: { selectEmotion("Joyeuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Enthousiaste",
                                    isSelected: selectedEmotion == "Enthousiaste",
                                    onTap: { selectEmotion("Enthousiaste") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Satisfaite",
                                    isSelected: selectedEmotion == "Satisfaite",
                                    onTap: { selectEmotion("Satisfaite") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Sur un nuage",
                                    isSelected: selectedEmotion == "Sur un nuage",
                                    onTap: { selectEmotion("Sur un nuage") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "orange",
                                    emotion: "Emplie d'espoir",
                                    isSelected: selectedEmotion == "Emplie d'espoir",
                                    onTap: { selectEmotion("Emplie d'espoir") }
                                ).frame(width: 120)
                            }
                        }
                    }
                    
                    Group {
                        Text("Fatigue")
                            .fontWidth(.expanded)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Vaseuse",
                                    isSelected: selectedEmotion == "Vaseuse",
                                    onTap: { selectEmotion("Vaseuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Anéantie",
                                    isSelected: selectedEmotion == "Anéantie",
                                    onTap: { selectEmotion("Anéantie") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Exténuée",
                                    isSelected: selectedEmotion == "Exténuée",
                                    onTap: { selectEmotion("Exténuée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Fatiguée",
                                    isSelected: selectedEmotion == "Fatiguée",
                                    onTap: { selectEmotion("Fatiguée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Indisposée",
                                    isSelected: selectedEmotion == "Indisposée",
                                    onTap: { selectEmotion("Indisposée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Déprimée",
                                    isSelected: selectedEmotion == "Déprimée",
                                    onTap: { selectEmotion("Déprimée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Ennuyée",
                                    isSelected: selectedEmotion == "Ennuyée",
                                    onTap: { selectEmotion("Ennuyée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Las",
                                    isSelected: selectedEmotion == "Las",
                                    onTap: { selectEmotion("Las") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Meurtrie",
                                    isSelected: selectedEmotion == "Meurtrie",
                                    onTap: { selectEmotion("Meurtrie") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "vert",
                                    emotion: "Surmenage",
                                    isSelected: selectedEmotion == "Surmenage",
                                    onTap: { selectEmotion("Surmenage") }
                                ).frame(width: 120)
                            }
                        }
                    }
                    
                    Group {
                        Text("Colère")
                            .fontWidth(.expanded)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Rancoeur",
                                    isSelected: selectedEmotion == "Rancoeur",
                                    onTap: { selectEmotion("Rancoeur") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Envieuse",
                                    isSelected: selectedEmotion == "Envieuse",
                                    onTap: { selectEmotion("Envieuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Agacée",
                                    isSelected: selectedEmotion == "Agacée",
                                    onTap: { selectEmotion("Agacée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Jalouse",
                                    isSelected: selectedEmotion == "Jalouse",
                                    onTap: { selectEmotion("Jalouse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Dégoûtée",
                                    isSelected: selectedEmotion == "Dégoûtée",
                                    onTap: { selectEmotion("Dégoûtée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Haineuse",
                                    isSelected: selectedEmotion == "Haineuse",
                                    onTap: { selectEmotion("Haineuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Aigrie",
                                    isSelected: selectedEmotion == "Aigrie",
                                    onTap: { selectEmotion("Aigrie") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Irritable",
                                    isSelected: selectedEmotion == "Irritable",
                                    onTap: { selectEmotion("Irritable") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Enragée",
                                    isSelected: selectedEmotion == "Enragée",
                                    onTap: { selectEmotion("Enragée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "rouge",
                                    emotion: "Exaspérée",
                                    isSelected: selectedEmotion == "Exaspérée",
                                    onTap: { selectEmotion("Exaspérée") }
                                ).frame(width: 120)
                            }
                        }
                    }
                    
                    Group {
                        Text("Peur")
                            .fontWidth(.expanded)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Horrifiée",
                                    isSelected: selectedEmotion == "Horrifiée",
                                    onTap: { selectEmotion("Horrifiée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Apeurée",
                                    isSelected: selectedEmotion == "Apeurée",
                                    onTap: { selectEmotion("Apeurée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Terrifiée",
                                    isSelected: selectedEmotion == "Terrifiée",
                                    onTap: { selectEmotion("Terrifiée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Angoissée",
                                    isSelected: selectedEmotion == "Angoissée",
                                    onTap: { selectEmotion("Angoissée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Stressée",
                                    isSelected: selectedEmotion == "Stressée",
                                    onTap: { selectEmotion("Stressée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Insécure",
                                    isSelected: selectedEmotion == "Insécure",
                                    onTap: { selectEmotion("Insécure") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Impuissante",
                                    isSelected: selectedEmotion == "Impuissante",
                                    onTap: { selectEmotion("Impuissante") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Inquiète",
                                    isSelected: selectedEmotion == "Inquiète",
                                    onTap: { selectEmotion("Inquiète") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Effrayée",
                                    isSelected: selectedEmotion == "Effrayée",
                                    onTap: { selectEmotion("Effrayée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "bleu",
                                    emotion: "Nerveuse",
                                    isSelected: selectedEmotion == "Nerveuse",
                                    onTap: { selectEmotion("Nerveuse") }
                                ).frame(width: 120)
                            }
                        }
                    }
                    
                    Group {
                        Text("Tristesse")
                            .fontWidth(.expanded)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Déprimée",
                                    isSelected: selectedEmotion == "Déprimée",
                                    onTap: { selectEmotion("Déprimée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Honteuse",
                                    isSelected: selectedEmotion == "Honteuse",
                                    onTap: { selectEmotion("Honteuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Déçue",
                                    isSelected: selectedEmotion == "Déçue",
                                    onTap: { selectEmotion("Déçue") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Mélancolique",
                                    isSelected: selectedEmotion == "Mélancolique",
                                    onTap: { selectEmotion("Mélancolique") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Délaissée",
                                    isSelected: selectedEmotion == "Délaissée",
                                    onTap: { selectEmotion("Délaissée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Désespérée",
                                    isSelected: selectedEmotion == "Désespérée",
                                    onTap: { selectEmotion("Désespérée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Triste",
                                    isSelected: selectedEmotion == "Triste",
                                    onTap: { selectEmotion("Triste") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Bouleversée",
                                    isSelected: selectedEmotion == "Bouleversée",
                                    onTap: { selectEmotion("Bouleversée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Nostalgique",
                                    isSelected: selectedEmotion == "Nostalgique",
                                    onTap: { selectEmotion("Nostalgique") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "gris",
                                    emotion: "Contrariée",
                                    isSelected: selectedEmotion == "Contrariée",
                                    onTap: { selectEmotion("Contrariée") }
                                ).frame(width: 120)
                            }
                        }
                    }
                    
                    Group {
                        Text("Surprise")
                            .fontWidth(.expanded)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Ebahie",
                                    isSelected: selectedEmotion == "Ebahie",
                                    onTap: { selectEmotion("Ebahie") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Attérée",
                                    isSelected: selectedEmotion == "Attérée",
                                    onTap: { selectEmotion("Attérée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Emue",
                                    isSelected: selectedEmotion == "Emue",
                                    onTap: { selectEmotion("Emue") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Sidérée",
                                    isSelected: selectedEmotion == "Sidérée",
                                    onTap: { selectEmotion("Sidérée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Perplexe",
                                    isSelected: selectedEmotion == "Perplexe",
                                    onTap: { selectEmotion("Perplexe") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Touchée",
                                    isSelected: selectedEmotion == "Touchée",
                                    onTap: { selectEmotion("Touchée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Emerveillée",
                                    isSelected: selectedEmotion == "Emerveillée",
                                    onTap: { selectEmotion("Emerveillée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Choquée",
                                    isSelected: selectedEmotion == "Choquée",
                                    onTap: { selectEmotion("Choquée") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Confuse",
                                    isSelected: selectedEmotion == "Confuse",
                                    onTap: { selectEmotion("Confuse") }
                                ).frame(width: 120)
                                
                                MoodValidationStick(
                                    stickColor: "violet",
                                    emotion: "Submergée",
                                    isSelected: selectedEmotion == "Submergée",
                                    onTap: { selectEmotion("Submergée") }
                                ).frame(width: 120)
                            }
                        }
                    }
                    
                    if #available(iOS 26.0, *) {
                        Button(action: {
                            enregistrerEmotion()
                        }) {
                            ButtonForm(title: "Enregistrer", isImage: true)
                        }
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 20)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
        }
    }
    
    // Fonction pour gérer la sélection d'UNE SEULE émotion au total
    private func selectEmotion(_ emotion: String) {
        if selectedEmotion == emotion {
            // Si on reclique sur l'émotion déjà sélectionnée, on la désélectionne
            selectedEmotion = nil
        } else {
            // Sinon on sélectionne cette émotion (l'ancienne est automatiquement désélectionnée)
            selectedEmotion = emotion
        }
    }
    
    // Fonction pour enregistrer l'émotion du jour dans la base de données
    private func enregistrerEmotion() {
        if let emotion = selectedEmotion {
            print("Émotion du jour sélectionnée:", emotion)
            
            // Ici tu envoies l'émotion à ton API Vapor
            // Exemple : await saveEmotionToAPI(emotion: emotion)
        } else {
            print("Aucune émotion sélectionnée")
        }
    }
}

#Preview {
    EmotionListView()
}
