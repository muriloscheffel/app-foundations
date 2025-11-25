//
//  ContentView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI



var std: Studio = Studio(name: "Studio Zen", modality: "Yoga", image: imageURL)

struct ExploreView: View {
    var body: some View {
        ScrollView {
            CardView(studio: std)
                .onTapGesture {
                    
                }
        }
    }
}

#Preview {
    ExploreView()
}
