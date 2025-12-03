//
//  TabBar.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI

struct TabBar: View {
    
    @State var estabelecimentos: [Estabelecimento] = carregarJSON()
    
    var body: some View {
        TabView {
            Tab("Explorar", systemImage: "list.bullet.rectangle.portrait.fill") {
                NavigationStack {
                    ExploreView()
                }
            }
            
            Tab("Mapa", systemImage: "map") {
                NavigationStack {
                    MapView()
                }
            }
            
            Tab("Modalidades", systemImage: "figure.stand") {
                NavigationStack {
                    ModalidadesView()
                }
            }
        }
        .tint(Color("DarkLight"))
    }
}

#Preview {
    TabBar()
}
