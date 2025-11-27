//
//  MapView.swift
//  app-foundations
//
//  Created by aluno-15 on 25/11/25.
//

import SwiftUI
import MapKit

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapView: View {
    
    @State private var cameraPosition: MapCameraPosition = .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: -30.0346, longitude: -51.2177),
                span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
            )
        )
        
        // Lista de anotações
        let annotations = [
            Location(name: "PUCRS", coordinate: CLLocationCoordinate2D(latitude: -30.0346471, longitude: -51.2176584))
        ]
    
    var body: some View {
        Map(position: $cameraPosition) {
                    // Adicione anotações (pins) DENTRO do corpo da Map
                    ForEach(annotations) { location in
                        // MapMarker foi substituído por Map(Content)Marker no iOS 17+
                        Marker(location.name, coordinate: location.coordinate)
                    }
                }
                .mapStyle(.standard) // Opcional: Define o estilo do mapa
                .ignoresSafeArea()
    }
}

#Preview {
    MapView()
}
