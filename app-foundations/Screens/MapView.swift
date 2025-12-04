//
//  MapView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {

    @State var estabelecimentos: [Estabelecimento] = carregarJSON()

//    @State var annotations: [Location] = []
    @State private var selectedEstabelecimento: Estabelecimento?

    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: -30.0346,
                longitude: -51.2177
            ),
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        )
    )

    var body: some View {
        Map(position: $cameraPosition) {
            
            ForEach(estabelecimentos) { estabelecimento in
                
                let location = CLLocationCoordinate2D(latitude: estabelecimento.latitutude ?? 0.0, longitude: estabelecimento.longitude ?? 0.0)
                
                Annotation(estabelecimento.nome, coordinate: location) {
                    Button("", systemImage: "pin.circle.fill") {
                        selectedEstabelecimento = estabelecimento
                    }
                    .foregroundStyle(.red)
                }
            }
        }
        .mapStyle(.standard)  // Opcional: Define o estilo do mapa
        .ignoresSafeArea()
        .navigationDestination(item: $selectedEstabelecimento) { estabelecimento in
            EstabelecimentoView(estabelecimento: estabelecimento)
        }
//        .onAppear {
//            annotations = estabelecimentos.map {
//                Location(
//                    name: $0.nome,
//                    coordinate: CLLocationCoordinate2D(
//                        latitude: $0.latitutude!,
//                        longitude: $0.longitude!
//                    )
//                )
//            }
//        }
    }
}

//#Preview {
//    MapView()
//}
