//
//  Studio.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import CoreLocation


struct Estabelecimento: Identifiable {
    var id = UUID()
    var name: String
    var modality: String
    var image: URL?
    var endereco: String?
    var avaliacao: Double?
    var sobre: String?
    var horario: String?
    var oferece: Oferecimentos?
    var latitude: Double?
    var longitude: Double?
    var isFavorite: Bool = false
    
}
