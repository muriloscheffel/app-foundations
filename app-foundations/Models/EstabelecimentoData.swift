//
//  EstabelecimentoData.swift
//  app-foundations
//
//  Created by aluno-15 on 03/12/25.
//

import Foundation
import SwiftData

@Model
final class EstabelecimentoData: Identifiable {
    var id: Int
    
    init(id: Int) {
        self.id = id
    }
}
