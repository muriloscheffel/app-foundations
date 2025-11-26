//
//  Oferecimentos.swift
//  app-foundations
//
//  Created by aluno-15 on 26/11/25.
//

import Foundation

enum Oferecimentos: CaseIterable, Codable {
    case wifi, estacionamento, acessivel, permitePet, vestiario, instrutores
    
    var name: String {
            switch self {
            case .wifi: return "Wi-Fi"
            case .estacionamento: return "Estacionamento"
            case .acessivel: return "Local acessível"
            case .permitePet: return "Aceita Pets"
            case .vestiario: return "Chuveiros"
            case .instrutores: return "Instrutores"
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
            }
        }
}
