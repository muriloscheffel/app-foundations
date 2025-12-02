//
//  Oferecimentos.swift
//  app-foundations
//
//  Created by aluno-15 on 26/11/25.
//

import Foundation

enum Oferecimentos: String, CaseIterable, Codable {
    case wifi = "WiFi"
    case estacionamento = "Estacionamento"
    case acessivel = "Acessivel"
    case permitePet = "PermitePets"
    case vestiario = "Vestiario"
    case instrutores = "Instrutores"
    case armarios = "Armarios"
    
    var name: String {
        switch self {
        case .wifi: return "Wi-Fi"
        case .estacionamento: return "Estacionamento"
        case .acessivel: return "Local acessível"
        case .permitePet: return "Aceita Pets"
        case .vestiario: return "Chuveiros"
        case .instrutores: return "Instrutores"
        case .armarios: return "Armários"
        }
    }
    
    var icon: String {
        switch self {
        case .wifi: return "wifi"
        case .estacionamento: return "e.circle"
        case .acessivel: return "figure.roll"
        case .permitePet: return "pawprint"
        case .vestiario: return "shower"
        case .instrutores: return "person.3.fill"
        case .armarios: return "cabinet"
        }
    }
}
