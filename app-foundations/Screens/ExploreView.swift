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
        VStack(alignment: .leading, spacing: 0) {
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
                        ForEach(estabelecimentos.sorted(by: { ($0.avaliacao) ?? 0.0 > ($1.avaliacao) ?? 0.0 })
                            .prefix(10),
                                id: \.self) { est in
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
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Favoritos")
                    .font(.title2)
                    .fontWeight(.bold)
                
                if estabelecimentosFavoritas.isEmpty {
                    Text("Você ainda não favoritou nenhum lugar.")
                        .foregroundColor(.gray)
                } else {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(estabelecimentosFavoritas, id: \.id) { est in
                                NavigationLink {
                                    EstabelecimentoView(estabelecimento: est)
                                } label: {
                                    CardView(estabelecimento: est)
                                }
                            }
                        }
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        
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
