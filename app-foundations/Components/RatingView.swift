//
//  RatingView.swift
//  app-foundations
//
//  Created by aluno-15 on 27/11/25.
//

import SwiftUI

struct RatingView: View {
    var rating: Double
    
    var body: some View {
        HStack(spacing: 2) {
            ForEach(0..<5) { index in
                Image(systemName: starType(for: index))
                    .foregroundColor(.accent)
            }
        }
    }
    
    func starType(for index: Int) -> String {
        let normalizedRating = rating
        
        if Double(index) < normalizedRating - 0.75 {
            return "star.fill" // Estrela cheia
        } else if Double(index) < normalizedRating - 0.25 {
            return "star.leadinghalf.fill" // Meia estrela
        } else {
            return "star" // Estrela vazia
        }
    }
}

#Preview {
    RatingView(rating: 3)
}
