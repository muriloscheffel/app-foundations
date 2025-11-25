//
//  ContentView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var searchText: String = ""
    
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
            }
            .padding()
            
            VStack (alignment: .leading, spacing: 16){
                Text("Favoritos")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding()
            
            
        }
    }
}

#Preview {
    ExploreView()
}
