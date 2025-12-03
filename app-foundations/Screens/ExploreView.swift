//
//  ContentView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI
import SwiftData


struct ExploreView: View {
    
    @State private var searchText: String = ""
    
    @State private var showSettings: Bool = false
    
    var estabelecimentos: [Estabelecimento] = carregarJSON()
    
    @Query var idEstabsFavs: [EstabelecimentoData]
    
    private var estabelecimentosFavoritas: [Estabelecimento] {
        let favIDs = Set(idEstabsFavs.map { $0.id })
        return estabelecimentos.filter { favIDs.contains($0.id) }
    }
    
    var filteredModalidades: [Estabelecimento] {
        if searchText.isEmpty {
            return []
        }
        else {
            return estabelecimentos.filter { $0.nome.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    
    var body: some View {
        VStack {
            VStack (alignment: .leading, spacing: 16){
                Text("Descubra")
                    .font(.title2)
                    .fontWeight(.bold)
                
                SearchBar(text: $searchText)
                
            }
            .padding()
            
            VStack (alignment: .leading, spacing: 16){
                Text("Em Alta")
                    .font(.title2)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(estabelecimentos.sorted(by: { ($0.avaliacao) ?? 0.0 > ($1.avaliacao) ?? 0.0 }), id: \.self) { est in
                            NavigationLink {
                                EstabelecimentoView(estabelecimento: est)
                            } label: {
                                CardView(estabelecimento: est)
                            }
                        }
                        
                    }
                }
            }
            .padding()
            
            VStack (alignment: .leading, spacing: 16){
                Text("Favoritos")
                    .font(.title2)
                    .fontWeight(.bold)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(0..<estabelecimentosFavoritas.count, id: \.self) { id in
                            NavigationLink {
                                EstabelecimentoView(estabelecimento: estabelecimentosFavoritas[id])
                            } label: {
                                CardView(estabelecimento: estabelecimentosFavoritas[id])
                            }
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
            
        }
        .sheet(isPresented: $showSettings, content: {
            Preferencias()
        })
        //        .toolbar {
        //            ToolbarItem(placement: .topBarTrailing) {
        //                Button("Configurações", systemImage: "gear") {
        //                    showSettings = true
        //                }
        //            }
        //        }
        //        .onAppear {
        //            estabelecimentos = carregarJSON()
        //        }
    }
}

#Preview {
    ExploreView()
}
