//
//  app_foundationsApp.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI
import SwiftData

@main
struct app_foundationsApp: App {
    var body: some Scene {
        WindowGroup {
            TabBar()
        }
        .modelContainer(for: EstabelecimentoData.self)
    }
}
