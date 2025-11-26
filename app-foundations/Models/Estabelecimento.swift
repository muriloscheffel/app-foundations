//
//  Studio.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import CoreLocation


struct Estabelecimento: Identifiable {
    let id = UUID()
    let name: String
    let modality: String
    let image: URL?
    let endereco: String?
    let avaliacao: Double?
    let sobre: String?
    let horario: String?
    let oferece: String? // enum
    let latitude: Double?
    let longitude: Double?
    let isFavorite: Bool?
}
