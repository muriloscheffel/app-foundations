//
//  CardViewModalidadesButton.swift
//  app-foundations
//
//  Created by aluno-03 on 03/12/25.
//

import SwiftUI

struct CardViewLongo: View {
    
    let estabelecimento: Estabelecimento
    
    var body: some View {

            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: estabelecimento.imagem ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(0.3)
                }
                .frame(width: 372, height: 100)
                .clipped()
                
                   
                LinearGradient(
                        colors: [.accent.opacity(1), .clear],
                        startPoint: .bottom,
                        endPoint: .center
                )
                
                
                VStack(alignment: .leading) {
                    Text(estabelecimento.nome)
                        .foregroundStyle(.white)
                        .font(Font.system(size: 20))
                    Text(estabelecimento.workoutType?.nameEnglish ?? estabelecimento.modalidade)
                        .foregroundStyle(.white)
                        .font(Font.system(size: 12))
                }
                .padding([.leading, .bottom], 8)
                
            }
            .frame(width: 372, height: 100)
            .cornerRadius(8)
        
    }
}

#Preview {
    let std: Estabelecimento = Estabelecimento(id: 0, nome: "Studio Zen", modalidade: "Yoga", imagem: imageURL)
    CardViewLongo(estabelecimento: std)
}
