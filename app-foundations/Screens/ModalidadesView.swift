//
//  ModalidadesView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI

struct ModalidadesView: View {
    
    @State private var searchText: String = ""
    
    // carrega todos os estabelecimentos
    @State private var estabelecimentos: [Estabelecimento] = carregarJSON()
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var filteredModalidades: [WorkoutActivityType] {
        let todasOrdenadas = WorkoutActivityType.allCases.sorted { $0.name < $1.name }
        
        if searchText.isEmpty {
            return todasOrdenadas
        } else {
            return todasOrdenadas.filter {
                $0.name.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Modalidades")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    SearchBar(text: $searchText)
                    
                    LazyVGrid(columns: columns, spacing: 8) {
                        ForEach(filteredModalidades) { modalidade in
                            NavigationLink {
                                EstabelecimentoModalidadeView(
                                    modalidade: modalidade,
                                    estabelecimentos: estabelecimentos
                                )
                            } label: {
                                ModalidadeButton(modalidade: modalidade)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

#Preview {
    ModalidadesView()
}
