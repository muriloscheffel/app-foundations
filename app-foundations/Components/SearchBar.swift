//
//  SearchBar.swift
//  app-foundations
//
//  Created by aluno-03 on 25/11/25.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                .background(
                    RoundedRectangle(cornerRadius: 24, style: .continuous)
                        .fill(Color.white)
                )
            
            HStack {
                TextField("", text: $text, prompt: Text("Buscar modalidades...")
                    .foregroundColor(colorScheme == .dark ? .black : .gray) )
                .padding(.leading, 16)
                .padding(.vertical, 10)
                .foregroundStyle(Color.black)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.black)
                    .padding(.trailing, 16)
            }
        }
        .frame(height: 48)
    }
}


#Preview {
    SearchBar(text: .constant (""))
        .padding()
}
