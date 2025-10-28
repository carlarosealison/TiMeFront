//
//  ScrollMotivation.swift
//  TiMeFront
//
//  Created by Apprenant125 on 23/10/2025.
//

import SwiftUI

struct ScrollMotivation: View {
    @Binding var viewModel : JournalEditorViewModel
    var body: some View {
        VStack {
            GeometryReader { geo in
                var _ = geo.size.width/2
                
//                ForEach(viewModel.range) { tick in
//                    let x = center
//                }
                
            }
        }
    }
}

#Preview {
    ScrollMotivation(viewModel: .constant(JournalEditorViewModel()))
}
