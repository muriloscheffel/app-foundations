//
//  CardView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI

let imageURL = URL(string: "https://pranayogastudio.com.br/wp-content/uploads/2025/05/DSCF0907-HDR-2-1024x683.jpg")

struct CardView: View {
    
    let studio: Estabelecimento
    
    var body: some View {

            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: imageURL) { image in
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
                    Text(studio.name)
                        .foregroundStyle(.white)
                        .font(Font.system(size: 20))
                    Text(studio.modality)
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
    var std: Estabelecimento = Estabelecimento(name: "Studio Zen", modality: "Yoga", image: imageURL)
    CardView(studio: std)
}
