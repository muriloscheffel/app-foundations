//
//  ModalidadeButton.swift
//  app-foundations
//
//  Created by aluno-03 on 28/11/25.
//

import SwiftUI

struct ModalidadeButton: View {
    
    var modalidade: WorkoutActivityType
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Image(systemName: modalidade.icon)
                .resizable()
                .scaledToFit()
                .frame(height: 25)
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.top, 16)
            
            Text(modalidade.name)
                .foregroundStyle(.white)
                .font(Font.system(size: 20))
                .foregroundColor(.white)
                .padding(.leading, 16)
                .padding(.bottom, 16)
        }
        .frame(width: 180, height: 80, alignment: .leading)
        .background(Color(.accent))
        .cornerRadius(16)
        
        
        
        
    }
}

#Preview {
    ModalidadeButton(modalidade: .swimming)
}
