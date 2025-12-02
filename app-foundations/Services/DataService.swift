//
//  DataService.swift
//  app-foundations
//
//  Created by aluno-15 on 01/12/25.
//

import Foundation

func carregarJSON() -> [Estabelecimento] {
    guard let url = Bundle.main.url(forResource: "csvjson", withExtension: "json") else {
        return []
    }
    
    do {
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode([Estabelecimento].self, from: data)
    } catch {
        print("Erro ao ler JSON: \(error)")
        return []
    }
}
