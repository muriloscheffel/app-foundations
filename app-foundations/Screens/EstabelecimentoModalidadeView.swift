//
//  EstabelecimentoModalidadeView.swift
//  app-foundations
//
//  Created by aluno-03 on 03/12/25.
//

import SwiftUI

struct EstabelecimentoModalidadeView: View {
    let modalidade: WorkoutActivityType
    let estabelecimentos: [Estabelecimento]
    
    var filtrados: [Estabelecimento] {
        estabelecimentos.filter {
            $0.modalidade.uppercased() == modalidade.name.uppercased()
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(filtrados) { estabelecimento in
                    NavigationLink {
                        EstabelecimentoView(estabelecimento: .constant(estabelecimento))
                    } label: {
                        CardViewLongo(estabelecimento: estabelecimento)
                    }
                }
            }
            .padding()
        }
        .navigationTitle(modalidade.name)
    }
}
