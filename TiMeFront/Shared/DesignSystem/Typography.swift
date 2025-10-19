//
//  Typography.swift
//  TiMeFront
//
//  Created by Thibault on 15/10/2025.
//

import SwiftUI

/// Exemple d'utilisation :
/// Text("Mon titre")
/// .mediumPurple()

// MARK: - Modifiers

struct HeavyTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 48, weight: .heavy, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct BoldTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 36, weight: .bold, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct SemiBoldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 24, weight: .semibold, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct MediumBlackStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .medium, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct MediumPurpleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .medium, design: .default))
            .fontWidth(.expanded)
            .foregroundColor(.purpleDark)
    }
}

struct BoldTextWhiteStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .bold, design: .default))
            .fontWidth(.expanded)
            .foregroundColor(.whitePurple)
    }
}

struct SemiBoldCardsTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .semibold, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct TextCardsStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 14, weight: .light, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct SubTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 12, weight: .light, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct SemiBoldTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleText)
    }
}

struct SemiBoldTitleCondensedStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .default))
            .fontWidth(.condensed)
            .foregroundStyle(.purpleText)
    }
}

struct SemiBoldTitlePurpleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 20, weight: .semibold, design: .default))
            .fontWidth(.expanded)
            .foregroundStyle(.purpleButton)
    }
}

// MARK: - Extensions

extension View {
    /// Heavy title - 48pt heavy expanded
    func heavyTitle() -> some View {
        modifier(HeavyTitleStyle())
    }
    
    /// Bold title - 36pt bold expanded
    func boldTitle() -> some View {
        modifier(BoldTitleStyle())
    }
    
    /// Semi bold - 24pt semibold expanded
    func semiBold() -> some View {
        modifier(SemiBoldStyle())
    }
    
    /// Medium black - 20pt medium expanded (black color)
    func mediumBlack() -> some View {
        modifier(MediumBlackStyle())
    }
    
    /// Medium purple - 20pt medium expanded (purple dark color)
    func mediumPurple() -> some View {
        modifier(MediumPurpleStyle())
    }
    
    /// Bold text white - 16pt bold expanded (white color)
    func boldTextWhite() -> some View {
        modifier(BoldTextWhiteStyle())
    }
    
    /// Semi bold cards title - 14pt semibold expanded
    func semiBoldCardsTitle() -> some View {
        modifier(SemiBoldCardsTitleStyle())
    }
    
    /// Text cards - 14pt light expanded
    func textCards() -> some View {
        modifier(TextCardsStyle())
    }
    
    /// Subtitle - 12pt light expanded
    func subTitle() -> some View {
        modifier(SubTitleStyle())
    }
    
    /// Semi bold title - 20pt semibold expanded
    func semiBoldTitle() -> some View {
        modifier(SemiBoldTitleStyle())
    }
    
    /// Semi bold condensed title - 20pt semibold expanded
    func semiBoldCondensedTitle() -> some View {
        modifier(SemiBoldTitleCondensedStyle())
    }
    
    /// Semi bold purple title - 20pt semibold expanded
    func semiBoldPurpleTitle() -> some View {
        modifier(SemiBoldTitlePurpleStyle())
    }
}

// MARK: - Exemples

#Preview("Typography Showcase") {
    ScrollView {
        VStack(alignment: .leading, spacing: 20) {
            Text("Heavy Title 48pt")
                .heavyTitle()
            
            Text("Bold Title 36pt")
                .boldTitle()
            
            Text("Semi Bold 24pt")
                .semiBold()
            
            Text("Medium Black 20pt")
                .mediumBlack()
            
            Text("Medium Purple 20pt")
                .mediumPurple()
            
            Text("Bold Text White 16pt")
                .boldTextWhite()
                .padding()
                .background(Color.blue)
            
            Text("Semi Bold Cards Title 14pt")
                .semiBoldCardsTitle()
            
            Text("Text Cards 14pt")
                .textCards()
            
            Text("Subtitle 12pt")
                .subTitle()
            
            Text("Semi Bold Title 20pt")
                .semiBoldTitle()
            
            Text("Semi Bold Condensed Title 20pt")
                .semiBoldCondensedTitle()
            
            Text("Semi Bold Purple Title 20pt")
                .semiBoldPurpleTitle()
        }
        .padding()
    }
}
