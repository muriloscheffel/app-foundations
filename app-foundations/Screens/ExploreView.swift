//
//  ContentView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI


struct ExploreView: View {
    
    @State private var searchText: String = ""
    
    @State private var showSettings: Bool = false
    
    @State var estabelecimentos: [Estabelecimento] = carregarJSON()
    
    private var filteredEstabelecimentos: Binding<[Estabelecimento]> {
        Binding {
            estabelecimentos.sorted(by: { ($0.avaliacao) ?? 0.0 > ($1.avaliacao) ?? 0.0 })
        } set: { value in
            estabelecimentos = value
        }
    }
    
    @State private var mostraEstabelecimentosFavoritos: Bool = false
    
    var estabelecimentosFavoritos: Binding<[Estabelecimento]> {
        
        Binding(
            get: {
                return estabelecimentos.filter { $0.isFavorite == true }
                
            },
            
            set: { newValue in
                estabelecimentos = newValue
            }
        )
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
                        ForEach(0..<filteredEstabelecimentos.count, id: \.self) { id in
                            NavigationLink {
                                EstabelecimentoView(estabelecimento: filteredEstabelecimentos[id])
                            } label: {
                                CardView(estabelecimento: filteredEstabelecimentos[id].wrappedValue)
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
                        ForEach(0..<estabelecimentosFavoritos.count, id: \.self) { id in
                            NavigationLink {
                                EstabelecimentoView(estabelecimento: estabelecimentosFavoritos[id])
                            } label: {
                                CardView(estabelecimento: estabelecimentosFavoritos[id].wrappedValue)
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
