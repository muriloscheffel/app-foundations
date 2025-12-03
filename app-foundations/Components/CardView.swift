//
//  CardView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI

let imageURL = "https://pranayogastudio.com.br/wp-content/uploads/2025/05/DSCF0907-HDR-2-1024x683.jpg"
let anotherImageURL = "https://assets-cdn.wellhub.com/images/?su=https%3A%2F%2Fimages.partners.gympass.com%2Fimage%2Fpartners%2F98faf983-c9f1-4868-9494-91e2224c80ff%2Flg_503473fb-d413-44d7-9245-4c8fb54b3d78_f0aed928608742ecb9867819c5accf2b.jpeg&h=360"

struct CardView: View {
    
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
                .frame(width: 180, height: 100)
                .clipped()
                   
                LinearGradient(
                        colors: [.accent.opacity(1), .clear],
                        startPoint: .bottom,
                        endPoint: .center
                )
                
                
                VStack(alignment: .leading) {
                    Text(estabelecimento.nome)
                        .foregroundStyle(.white)
                        .font(Font.system(size: 16))
                    Text(estabelecimento.modalidade)
                        .foregroundStyle(.white)
                        .font(Font.system(size: 12))
                }
                .padding([.leading, .bottom], 8)
                
            }
            .frame(width: 180, height: 100)
            .cornerRadius(8)
        
    }
}

#Preview {
    let std: Estabelecimento = Estabelecimento(id: 0, nome: "Studio Zen", modalidade: "Yoga", imagem: imageURL)
    CardView(estabelecimento: std)
}
