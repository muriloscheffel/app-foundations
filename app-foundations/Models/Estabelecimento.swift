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
    var latitutude: Double?
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
        case latitutude
        case longitude
    }
    
    func ofereceToEnum() -> [Oferecimentos] {
        guard let splitedOfere = oferece?.split(separator: ",") else {
            return []
        }
        
        var ofereList: [Oferecimentos] = []
        
        for value in splitedOfere {
            let trimmed = value
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .capitalized
            
            if let oferecimento = Oferecimentos(rawValue: trimmed) {
                ofereList.append(oferecimento)
            } else {
                print("Valor inválido no JSON para Oferecimentos: '\(trimmed)'")
            }
        }
        
        return ofereList
    }
}

extension Estabelecimento {
    var workoutType: WorkoutActivityType? {
        WorkoutActivityType(rawValue: modalidade)
    }
}
