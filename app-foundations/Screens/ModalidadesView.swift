//
//  ModalidadesView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI

struct ModalidadesView: View {
    
    @State private var searchText: String = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Modalidades")
                    .font(.title2)
                    .fontWeight(.bold)
                SearchBar(text: $searchText)
                
                
            }
        }
        .padding()
    }
}

#Preview {
    ModalidadesView()
}
