//
//  OferecimentosView.swift
//  app-foundations
//
//  Created by aluno-15 on 28/11/25.
//

import SwiftUI

struct OferecimentosView: View {
    
    let oferece: Oferecimentos
    
    var body: some View {
        HStack {
            Image(systemName: oferece.icon)
                .font(.title2)
                .frame(width: 30)
                .accessibilityHidden(true)
                .foregroundStyle(.accent)
            
            Text(oferece.name)
                .font(.body)
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    OferecimentosView(oferece: .permitePet)
}
