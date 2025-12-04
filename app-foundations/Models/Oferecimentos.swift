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
    case chuveiro = "Chuveiro"
    
    var name: String {
        switch self {
        case .wifi:           return String(localized: "Wi-Fi")
        case .estacionamento: return String(localized: "Estacionamento")
        case .acessivel:      return String(localized: "Local acessível")
        case .permitePet:     return String(localized: "Aceita Pets")
        case .vestiario:      return String(localized: "Vestiários")
        case .instrutores:    return String(localized: "Instrutores")
        case .armarios:       return String(localized: "Armários")
        case .chuveiro:       return String(localized: "Chuveiro")
        }
    }
    
    var icon: String {
        switch self {
        case .wifi: return "wifi"
        case .estacionamento: return "e.circle"
        case .acessivel: return "figure.roll"
        case .permitePet: return "pawprint"
        case .vestiario: return "tshirt"
        case .instrutores: return "person.3.fill"
        case .armarios: return "cabinet"
        case .chuveiro: return "shower"
        }
    }
}
