    //
    //  RecordView.swift
    //  TiMeFront
    //
    //  Created by Thibault on 30/10/2025.
    //

import SwiftUI

@available(iOS 26.0, *)
struct RecordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isRecording = false
    @State private var recordingTime: TimeInterval = 0
    @State private var timer: Timer?
    @State private var waveformHeights: [CGFloat] = Array(repeating: 20, count: 20)
    @State private var animationTimer: Timer?
    @State private var showSaveAlert = false
    
    var body: some View {
        ZStack {
            Color("PurpleButton")
                .ignoresSafeArea()
            
            VStack(spacing: 60) {
                Spacer()
                
                    // Animation
                if isRecording {
                    HStack(spacing: 4) {
                        ForEach(0..<20, id: \.self) { index in
                            RoundedRectangle(cornerRadius: 4)
                                .fill(.white)
                                .frame(width: 4, height: waveformHeights[index])
                                .animation(.easeInOut(duration: 0.3), value: waveformHeights[index])
                        }
                    }
                    .frame(height: 80)
                }
                
                    // Micro boutton
                Button(action: toggleRecording) {
                    ZStack {
                        if isRecording {
                            Circle()
                                .fill(.white.opacity(0.2))
                                .frame(width: 220, height: 220)
                                .scaleEffect(isRecording ? 1.1 : 1.0)
                                .animation(
                                    .easeInOut(duration: 1.0)
                                    .repeatForever(autoreverses: true),
                                    value: isRecording
                                )
                        }
                        
                        Circle()
                            .fill(.white.opacity(0.3))
                            .frame(width: 180, height: 180)
                            .overlay {
                                Circle()
                                    .stroke(
                                        LinearGradient(
                                            colors: [
                                                .white.opacity(0.6),
                                                .white.opacity(0.1)
                                            ],
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ),
                                        lineWidth: 2
                                    )
                            }
                            .shadow(color: .black.opacity(0.15), radius: 20, x: 0, y: 10)
                            .background(
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 180, height: 180)
                            )
                            .overlay {
                                Image(systemName: isRecording ? "stop.fill" : "mic.fill.badge.plus")
                                    .font(.system(size: 60))
                                    .foregroundStyle(.white)
                                    .symbolEffect(.bounce, value: isRecording)
                            }
                    }
                }
                .buttonStyle(ScaleButtonStyle())
                
                    // Timer
                Text(formatTime(recordingTime))
                    .font(.system(size: 42, weight: .medium).monospacedDigit())
                    .foregroundStyle(.white)
                    .animation(.easeInOut, value: isRecording)
                
                if !isRecording && recordingTime > 0 {
                    Button(action: saveRecording) {
                        HStack(spacing: 12) {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 20))
                                
                                Text("Enregistrer")
                                    .font(.system(size: 18, weight: .semibold).width(.expanded))
                            }
                        .foregroundStyle(Color("PurpleButton"))
                        .frame(maxWidth: .infinity)
                        .frame(height: 56)
                        .background(.white)
                        .cornerRadius(28)
                        .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 5)
                    }
                    .padding(.horizontal, 40)
                    .transition(.scale.combined(with: .opacity))
                }
                
                Spacer()
            }
        }
        .navigationTitle("Enregistrement vocal")
        .navigationBarTitleDisplayMode(.automatic)
        .onDisappear {
            stopRecording()
        }
        .alert("Enregistrement sauvegardé", isPresented: $showSaveAlert) {
            Button("OK", role: .cancel) {
                    recordingTime = 0
            }
        } message: {
            Text("Votre enregistrement vocal a été sauvegardé avec succès !")
        }
    }
    
        // MARK: - Actions
    
    private func toggleRecording() {
        if isRecording {
            stopRecording()
        } else {
            startRecording()
        }
    }
    
    private func startRecording() {
        isRecording = true
        recordingTime = 0
        
            // Timer pour le temps
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            recordingTime += 0.1
        }
        
            // Timer pour l'animation de la forme
        animationTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            for i in 0..<waveformHeights.count {
                waveformHeights[i] = CGFloat.random(in: 20...80)
            }
        }
    }
    
    private func stopRecording() {
        isRecording = false
        timer?.invalidate()
        timer = nil
        animationTimer?.invalidate()
        animationTimer = nil
        waveformHeights = Array(repeating: 20, count: 20)
    }
    
    private func saveRecording() {
        print("Enregistrement sauvegardé : \(formatTime(recordingTime))")
        showSaveAlert = true
    }
    
    private func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

    // MARK: - Button Style
struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}

#Preview {
    if #available(iOS 26.0, *) {
        RecordView()
            .environment(AuthViewModel())
    }
}
