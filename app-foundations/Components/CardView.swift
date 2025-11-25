//
//  CardView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI

struct CardView: View {
    
    func acao() {}
    var nome: String
    var desc: String
    
    var body: some View {
        Button {
            acao()
        } label: {
            VStack(alignment: .leading) {
                Text(nome)
                    .foregroundStyle(.white)
                Text(desc)
                    .foregroundStyle(.white)
                
            }
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 16)
                
        )
    }
}

#Preview {
    CardView(nome: "oii", desc: "yoga")
}
