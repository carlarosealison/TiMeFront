    //
    //  EmotionListView.swift
    //  TiMeFront
    //
    //  Created by Mounir on 28/10/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
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
                    
                    Text("Amour")
                        .padding(.horizontal)
                        .fontWidth(.expanded)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Excitée",
                                isSelected: selectedEmotion == "Excitée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }
                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Tendre",
                                isSelected: selectedEmotion == "Tendre",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }
                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Attentionnée",
                                isSelected: selectedEmotion == "Attentionnée", buttonSign: "",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }
                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Passionnée",
                                isSelected: selectedEmotion == "Passionnée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }
                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Paisible",
                                isSelected: selectedEmotion == "Paisible",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Affectueuse",
                                isSelected: selectedEmotion == "Affectueuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Romantique",
                                isSelected: selectedEmotion == "Romantique",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Amoureuse",
                                isSelected: selectedEmotion == "Amoureuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Désir",
                                isSelected: selectedEmotion == "Désir",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rose",
                                emotion: "Envie",
                                isSelected: selectedEmotion == "Envie",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                        }
                    }
                    .background(Color.clear)
                    
                    Text("Joie")
                        .padding(.horizontal)
                        .fontWidth(.expanded)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Fascinée",
                                isSelected: selectedEmotion == "Fascinée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Optimiste",
                                isSelected: selectedEmotion == "Optimiste",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Reconnaissante",
                                isSelected: selectedEmotion == "Reconnaissante",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Fière",
                                isSelected: selectedEmotion == "Fière",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Heureuse",
                                isSelected: selectedEmotion == "Heureuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Joyeuse",
                                isSelected: selectedEmotion == "Joyeuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Enthousiaste",
                                isSelected: selectedEmotion == "Enthousiaste",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Satisfaite",
                                isSelected: selectedEmotion == "Satisfaite",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Sur un nuage",
                                isSelected: selectedEmotion == "Sur un nuage",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "orange",
                                emotion: "Emplie d'espoir",
                                isSelected: selectedEmotion == "Emplie d'espoir",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                        }
                    }
                    
                    Text("Fatigue")
                        .padding(.horizontal)
                        .fontWidth(.expanded)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0){
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Vaseuse",
                                isSelected: selectedEmotion == "Vaseuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Anéantie",
                                isSelected: selectedEmotion == "Anéantie",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Exténuée",
                                isSelected: selectedEmotion == "Exténuée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Fatiguée",
                                isSelected: selectedEmotion == "Fatiguée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Indisposée",
                                isSelected: selectedEmotion == "Indisposée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Déprimée",
                                isSelected: selectedEmotion == "Déprimée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Ennuyée",
                                isSelected: selectedEmotion == "Ennuyée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Las",
                                isSelected: selectedEmotion == "Las",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Meurtrie",
                                isSelected: selectedEmotion == "Meurtrie",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "vert",
                                emotion: "Surmenage",
                                isSelected: selectedEmotion == "Surmenage",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                        }
                    }
                    
                    Text("Colère")
                        .padding(.horizontal)
                        .fontWidth(.expanded)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0){
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Rancoeur",
                                isSelected: selectedEmotion == "Rancoeur",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Envieuse",
                                isSelected: selectedEmotion == "Envieuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Agacée",
                                isSelected: selectedEmotion == "Agacée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Jalouse",
                                isSelected: selectedEmotion == "Jalouse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Dégoûtée",
                                isSelected: selectedEmotion == "Dégoûtée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Haineuse",
                                isSelected: selectedEmotion == "Haineuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Aigrie",
                                isSelected: selectedEmotion == "Aigrie",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Irritable",
                                isSelected: selectedEmotion == "Irritable",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Enragée",
                                isSelected: selectedEmotion == "Enragée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "rouge",
                                emotion: "Exaspérée",
                                isSelected: selectedEmotion == "Exaspérée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                        }
                    }
                    
                    Text("Peur")
                        .padding(.horizontal)
                        .fontWidth(.expanded)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0){
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Horrifiée",
                                isSelected: selectedEmotion == "Horrifiée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Apeurée",
                                isSelected: selectedEmotion == "Apeurée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Terrifiée",
                                isSelected: selectedEmotion == "Terrifiée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Angoissée",
                                isSelected: selectedEmotion == "Angoissée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Stressée",
                                isSelected: selectedEmotion == "Stressée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Insécure",
                                isSelected: selectedEmotion == "Insécure",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Impuissante",
                                isSelected: selectedEmotion == "Impuissante",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Inquiète",
                                isSelected: selectedEmotion == "Inquiète",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Effrayée",
                                isSelected: selectedEmotion == "Effrayée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "bleu",
                                emotion: "Nerveuse",
                                isSelected: selectedEmotion == "Nerveuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                        }
                    }
                    
                    Text("Tristesse")
                        .padding(.horizontal)
                        .fontWidth(.expanded)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0){
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Déprimée",
                                isSelected: selectedEmotion == "Déprimée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Honteuse",
                                isSelected: selectedEmotion == "Honteuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Déçue",
                                isSelected: selectedEmotion == "Déçue",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Mélancolique",
                                isSelected: selectedEmotion == "Mélancolique",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Délaissée",
                                isSelected: selectedEmotion == "Délaissée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Désespérée",
                                isSelected: selectedEmotion == "Désespérée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Triste",
                                isSelected: selectedEmotion == "Triste",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Bouleversée",
                                isSelected: selectedEmotion == "Bouleversée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Nostalgique",
                                isSelected: selectedEmotion == "Nostalgique",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "gris",
                                emotion: "Contrariée",
                                isSelected: selectedEmotion == "Contrariée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                        }
                    }
                    
                    Text("Surprise")
                        .padding(.horizontal)
                        .fontWidth(.expanded)
                        .bold()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0){
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Ebahie",
                                isSelected: selectedEmotion == "Ebahie",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Attérée",
                                isSelected: selectedEmotion == "Attérée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Emue",
                                isSelected: selectedEmotion == "Emue",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Sidérée",
                                isSelected: selectedEmotion == "Sidérée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Perplexe",
                                isSelected: selectedEmotion == "Perplexe",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Touchée",
                                isSelected: selectedEmotion == "Touchée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Emerveillée",
                                isSelected: selectedEmotion == "Emerveillée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Choquée",
                                isSelected: selectedEmotion == "Choquée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Confuse",
                                isSelected: selectedEmotion == "Confuse",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                            
                            MoodValidationStick(
                                stickColor: "violet",
                                emotion: "Submergée",
                                isSelected: selectedEmotion == "Submergée",
                                buttonSign: "plus",
                                onValidate: {
                                    print("Émotion validée")
                                },
                                onDelete: {
                                    print("Émotion supprimée")
                                }                            ).frame(width: 120)
                        }
                    }
                    
                    Group {
                        if #available(iOS 16.0, *) {
                            // Button is available on iOS 16 and later; adjust minimum as needed
                            Button(action: {
                                enregistrerEmotion()
                            }) {
                                ButtonForm(title: "Enregistrer", isImage: true)
                            }
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 20)
                        } else {
                            EmptyView()
                        }
                    }
                }
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
    if #available(iOS 26.0, *) {
        EmotionListView()
    }
}
