//
//  WorkoutActivityEnum.swift
//  Tibby
//
//  Edicao do arquivo Created by Felipe Elsner Silva on 25/11/25.
//

import Foundation

enum WorkoutActivityType: String, CaseIterable, Codable, Identifiable {
    case basketball, bowling, golf, gymnastics, handball,martialArts, sailing, outdoorSoccer, indoorSoccer,squash, swimming, tableTennis, tennis, traditionalStrengthTraining, volleyball, highIntensityIntervalTraining, pilates, stepTraining,equestrianSports,iceSkating, mindAndBody,dance
    /*
     Simple mapping of available workout types to a human readable name.
     */
    
    var id: String { self.rawValue }
    
    var name: String {
        switch self {
        case .basketball:                   return "Basquete"
        case .bowling:                      return "Boliche"
        case .dance:                        return "Dança"
        case .equestrianSports:             return "Hipismo"
        case .golf:                         return "Golf"
        case .gymnastics:                   return "Ginástica"
        case .handball:                     return "Handebol"
        case .highIntensityIntervalTraining:    return "HIIT"
        case .iceSkating:                   return "Patinação"
        case .indoorSoccer:                return "Futsal"
        case .martialArts:                  return "Artes Marciais"
        case .mindAndBody:                  return "Yoga"
        case .outdoorSoccer:                return "Futebol"
        case .pilates:                      return "Pilates"
        case .sailing:                      return "Vela"
        case .squash:                       return "Squash"
        case .stepTraining:                 return "Treino Funcional"
        case .swimming:                     return "Natação"
        case .tableTennis:                  return "Tênis de Mesa"
        case .tennis:                       return "Tênis"
        case .traditionalStrengthTraining:  return "Academia"
        case .volleyball:                   return "Vôlei"
        }
    }
    var icon: String {
        switch self {
        case .basketball:
            return "figure.basketball"
        case .bowling:
            return "figure.bowling"
        case .golf:
            return "figure.golf"
        case .gymnastics:
            return "figure.gymnastics"
        case .handball:
            return "figure.handball"
        case .martialArts:
            return "figure.martial.arts"
        case .sailing:
            return "figure.sailing"
        case .outdoorSoccer:
            return "figure.soccer"
        case .indoorSoccer:
            return "figure.soccer"
        case .squash:
            return "figure.squash"
        case .swimming:
            return "figure.pool.swim"
        case .tableTennis:
            return "figure.table.tennis"
        case .tennis:
            return "figure.tennis"
        case .traditionalStrengthTraining:
            return "figure.walk.treadmill"
            // caso queiram o alter de volta return "dumbbell.fill"
        case .volleyball:
            return "figure.volleyball"
        case .highIntensityIntervalTraining:
            return "figure.run"
        case .pilates:
            return "figure.pilates"
        case .stepTraining:
            return "figure.stairs"
        case .equestrianSports:
            return "figure.equestrian.sports"
        case .iceSkating:
            return "figure.skating"
        case .mindAndBody:
            return "figure.yoga"
        case .dance:
            return "figure.dance"
        }
    }
}
