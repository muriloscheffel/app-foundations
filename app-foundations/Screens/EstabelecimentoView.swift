//
//  EstabelecimentoView.swift
//  app-foundations
//
//  Created by aluno-15 on 27/11/25.
//

import SwiftUI
import MapKit
import SwiftData


struct EstabelecimentoView: View {
    
    var estabelecimento: Estabelecimento
    
    @State private var cameraPosition: MapCameraPosition = .camera(.init(.init()))
    
    @State var annotation: Location = Location(name: "", coordinate: CLLocationCoordinate2D.init().self)
    
    @Query var idEstabsFavs: [EstabelecimentoData]
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack(alignment: .leading) {
            
            
            // imagem do card
            ZStack(alignment: .top) {
                
                if let url = URL(string: estabelecimento.imagem ?? "") {
                    AsyncImage(url: url) { phase in
                        if let image = phase.image {
                            image.resizable()
                        } else if phase.error != nil {
                            Image(systemName: "exclamationmark.triangle.fill").resizable().scaledToFit().foregroundColor(.red).padding(50)
                        } else {
                            ProgressView().scaleEffect(1.5)
                        }
                    }
                    .scaledToFit()
                    .frame(height: 300)
                    .clipped()
                    .offset(y: -20)
                } else {
                    
                    Rectangle()
                        .fill(Color.gray)
                        .frame(height: 300)
                        .overlay(Text("Imagem Indisponível").foregroundColor(.white))
                    //                        .offset(y: -20)
                }
                
                
                RoundedRectangle(cornerRadius: 20)
                    .overlay {
                        // conteúdo do card
                        ScrollView {
                            VStack(alignment: .leading, spacing: 25) {
                                Text(estabelecimento.nome + " - " + estabelecimento.modalidade)
                                    .font(.largeTitle)
                                    .bold()
                                
                                // avaliação
                                HStack(spacing: 5) {
                                    RatingView(rating: estabelecimento.avaliacao!)
                                    Text("\(String(format: "%.1f", estabelecimento.avaliacao!))")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                Text(estabelecimento.endereco!)
                                    .font(.subheadline)
                                
                                DisclosureGroup("Toque para ver os horários") {
                                    Text(estabelecimento.horario!)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                    
                                }
                                
                                
                                HStack {
                                    Button("", systemImage: idEstabsFavs.contains { $0.id == estabelecimento.id } ? "heart.fill" : "heart") {
                                        let est = EstabelecimentoData(id: estabelecimento.id)
                                        if(!idEstabsFavs.contains(est)) {
                                            modelContext.insert(est)
                                        } else {
                                            let estIsFav = idEstabsFavs.first(where: { $0.id == estabelecimento.id })!
                                            modelContext.delete(estIsFav)
                                        }
                                        try? modelContext.save()
                                        //                                        estabelecimento.isFavorite.toggle()
                                    }
                                    .foregroundStyle(.darkLight)
                                    Text("Marcar/Desmarcar como Favorito")
                                    
                                }
                                
                                // sobre
                                VStack(alignment: .leading) {
                                    Text("Sobre")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    Text(estabelecimento.sobre!)
                                }
                                
                                // oq o lugar oferece
                                VStack(alignment: .leading) {
                                    Text("O que este lugar oferece")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    
                                    
                                    
                                    ForEach(estabelecimento.ofereceToEnum(), id: \.self) { oferta in
                                        OferecimentosView(oferece: oferta)
                                    }
                                }
                                
                                
                                // localização - mapa
                                VStack(alignment: .leading) {
                                    Text("Localização")
                                        .font(.title3)
                                        .fontWeight(.semibold)
                                    
                                    Map(position: $cameraPosition) {
                                        Marker(annotation.name, coordinate: annotation.coordinate)
                                    }
                                    .mapStyle(.standard)
                                    .frame(height: 200)
                                    .cornerRadius(20)
                                    
                                }
                            }
                            .padding(.bottom, 100)
                            .padding(.horizontal, 15)
                        }
                        .padding()
                        .foregroundStyle(.text)
                        //                        .padding(.bottom, 180)
                    }
                    .padding(.top, 245)
                    .foregroundStyle(.fundo)
                
            }
        }
        .ignoresSafeArea()
        .onAppear {
            
            let latitude = estabelecimento.latitutude ?? 0.0
            let longitude = estabelecimento.longitude ?? 0.0
            
            cameraPosition = .region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
                )
            )
            
            annotation = Location(name: estabelecimento.nome, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            
        }
        //        .cornerRadius(20)
        //        .offset(y: -100)
    }
}
//#Preview {
//    EstabelecimentoView(estabelecimento: estabelecimento)
//}
