//
//  Preferencias.swift
//  app-foundations
//
//  Created by aluno-15 on 26/11/25.
//

import SwiftUI


struct Preferencias: View {
    
    @State private var isDarkMode: Bool = true
    
    
    var body: some View {
        VStack {
            Toggle(isOn: $isDarkMode) {
                Text("Alterar Tema")
            }
        }
        .padding()
    }
}

#Preview {
    Preferencias()
}
