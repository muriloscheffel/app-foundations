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
    let endereco: String? = nil
    let avaliacao: Double? = nil
    let sobre: String? = nil
    let horario: String? = nil
    let oferece: Oferecimentos? = nil
    let latitude: Double? = nil
    let longitude: Double? = nil
    let isFavorite: Bool? = false
}
