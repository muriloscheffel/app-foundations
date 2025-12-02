//
//  Studio.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import CoreLocation


struct Estabelecimento: Identifiable, Decodable, Hashable {
    var id: Int
    var nome: String
    var modalidade: String
    var imagem: String?
    var endereco: String?
    var avaliacao: Double?
    var sobre: String?
    var horario: String?
    var oferece: String?
    var latitude: Double?
    var longitude: Double?
    var isFavorite: Bool = false
    
    enum CodingKeys: CodingKey {
        case id
        case nome
        case modalidade
        case imagem
        case endereco
        case avaliacao
        case sobre
        case horario
        case oferece
        case latitude
        case longitude
    }
    
    func ofereceToEnum() -> [Oferecimentos] {
        let splitedOfere = oferece?.split(separator: ",")
        var ofere: [Oferecimentos] = []
        
        if let splitedOfere {
            for value in splitedOfere {
                ofere.append(Oferecimentos(rawValue: String(value).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))!)
            }
        }
        
        return ofere
    }
}
