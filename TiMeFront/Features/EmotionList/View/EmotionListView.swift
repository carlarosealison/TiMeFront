//
//  EmotionListView.swift
//  TiMeFront
//
//  Created by Mounir on 28/10/2025.
//

import SwiftUI

struct EmotionListView: View {
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
                        .font(.title)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 44)
                .padding()
                //                .padding(.bottom, 10)
                
                VStack(alignment: .leading) {
                    
                    
                    Group {
                        Text("Amour")
                            .font(.title2)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                MoodValidationStick(stickColor:"rose", emotion: "Excitée").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Tendre").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Attentionnée").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Passionnée").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Paisible").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Affectueuse").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Romantique").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Amoureuse").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Désir").frame(width: 120)
                                MoodValidationStick(stickColor: "rose", emotion: "Envie").frame(width: 120)
                            }
                        }
                        .background(Color.clear)
                    }
                    
                    Group {
                        Text("Joie")
                            .font(.title2)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0) {
                                MoodValidationStick(stickColor: "orange", emotion: "Fascinée").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Optimiste").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Reconnaissante").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Fière").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Heureuse").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Joyeuse").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Enthousiaste").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Satisfaite").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Sur un nuage").frame(width: 120)
                                MoodValidationStick(stickColor: "orange", emotion: "Emplie d'espoir").frame(width: 120)
                            }
                        }
                    }
                    
                    Group {
                        Text("Fatigue")
                            .font(.title2)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(stickColor: "vert", emotion: "Vaseuse").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Anéantie").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Exténuée").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Fatiguée").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Indisposée").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Déprimée").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Ennuyée").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Las").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Meurtrie").frame(width: 120)
                                MoodValidationStick(stickColor: "vert", emotion: "Surmenage").frame(width: 120)
                                
                            }
                        }
                    }
                    
                    Group {
                        Text("Colère")
                            .font(.title2)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(stickColor: "rouge", emotion: "Rancoeur").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Envieuse").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Agacée").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Jalouse").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Dégoûtée").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Haineuse").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Aigrie").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Irritable").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Enragée").frame(width: 120)
                                MoodValidationStick(stickColor: "rouge", emotion: "Exaspérée").frame(width: 120)
                                
                            }
                        }
                    }
                    
                    Group {
                        Text("Peur")
                            .font(.title2)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(stickColor: "bleu", emotion: "Horrifiée").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Apeurée").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Terrifiée").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Angoissée").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Stressée").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Insécure").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Impuissante").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Inquiète").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Effrayée").frame(width: 120)
                                MoodValidationStick(stickColor: "bleu", emotion: "Nerveuse").frame(width: 120)
                                
                            }
                        }
                    }
                    
                    Group {
                        Text("Tristesse")
                            .font(.title2)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(stickColor: "gris", emotion: "Déprimée").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Honteuse").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Déçue").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Mélancolique").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Délaissée").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Désespérée").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Triste").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Bouleversée").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Nostalgique").frame(width: 120)
                                MoodValidationStick(stickColor: "gris", emotion: "Contrariée").frame(width: 120)
                                
                            }
                        }
                    }
                    
                    Group {
                        Text("Surprise")
                            .font(.title2)
                            .bold()
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 0){
                                MoodValidationStick(stickColor: "violet", emotion: "Ebahie").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Attérée").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Emue").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Sidérée").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Perplexe").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Touchée").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Emerveillée").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Choquée").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Confuse").frame(width: 120)
                                MoodValidationStick(stickColor: "violet", emotion: "Submergée").frame(width: 120)
                                
                            }
                        }
                    }
                    
                    if #available(iOS 26.0, *) {
                        ButtonForm(title: "Enregistrer", isImage: true)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .padding(.top, 20)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    EmotionListView()
}

