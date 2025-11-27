//
//  EstabelecimentoView.swift
//  app-foundations
//
//  Created by aluno-15 on 27/11/25.
//

import SwiftUI

struct EstabelecimentoView: View {
    
    let estabelecimentos: [Estabelecimento] = []
    
    @State var estabelecimento: Estabelecimento = Estabelecimento(name: "Studio Zen", modality: "Yoga", image: imageURL, endereco: "PUCRS - Campus Central", avaliacao: 3.5, sobre: "Studio especializado em Hatha e Vinysa Yoga", horario: "Seg-Dom: 08h00 - 20h00", oferece: Oferecimentos.estacionamento, latitude: -30.0346471, longitude: -51.2176584)
    
    var body: some View {
        VStack(alignment: .leading) {
          
                
                // --- 1. Imagem e Fundo (Topo) ---
                ZStack(alignment: .top) {
                    
                    // AsyncImage com ProgressView e tratamento de erro
                    if let url = imageURL {
                        AsyncImage(url: url) { phase in
                            if let image = phase.image {
                                image.resizable()
                            } else if phase.error != nil {
                                Image(systemName: "exclamationmark.triangle.fill").resizable().scaledToFit().foregroundColor(.red).padding(50)
                            } else {
                                ProgressView().scaleEffect(1.5)
                            }
                        }
                        .scaledToFit()
                        .frame(height: 300)
                        .clipped()
                    } else {
                        // Placeholder se a URL for nil
                        Rectangle()
                            .fill(Color.gray)
                            .frame(height: 300)
                            .overlay(Text("Imagem Indisponível").foregroundColor(.white))
                    }
                    
                    // Espaço Transparente para a Barra de Status (ZStack)
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 50)
                }
                
            // conteúdo do card
            VStack(alignment: .leading, spacing: 15) {
                Text(estabelecimento.name + " " + estabelecimento.modality)
                    .font(.largeTitle)
                    .bold()
                
                // avaliação
                HStack(spacing: 5) {
                    RatingView(rating: estabelecimento.avaliacao!)
                    Text("\(String(format: "%.1f", estabelecimento.avaliacao!))")
                                                .font(.subheadline)
                                                .foregroundColor(.gray)
                }
                Text(estabelecimento.endereco!)
                    .font(.subheadline)
                
                Text(estabelecimento.horario!)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                
                HStack {
                    Button("", systemImage: estabelecimento.isFavorite ? "heart.fill" : "heart") {
                        estabelecimento.isFavorite.toggle()
                    }
                    Text("Marcar/Desmarcar como Favorito")
                    
                }
            }
            .padding()
            Spacer()
        }
        
        .cornerRadius(20)
        .offset(y: -50)
    }
}
#Preview {
    EstabelecimentoView()
}
