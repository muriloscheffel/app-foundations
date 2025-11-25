//
//  Studio.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import Foundation

struct Estabelecimento: Identifiable {
    let id = UUID()
    let name: String
    let modality: String
    let image: URL?
}
