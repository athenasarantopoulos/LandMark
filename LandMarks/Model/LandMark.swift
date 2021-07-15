//
//  LandMark.swift
//  LandMarks
//
//  Created by Athena Fernandes Sarantôpoulos on 15/07/21.
//

import Foundation
import SwiftUI
import CoreLocation
// identifiable Use o Identifiableprotocolo para fornecer uma noção estável de identidade para uma classe ou tipo de valor. id por exemplo
struct Landmark: Hashable, Codable, Identifiable {// codable torna mais facil carregar dados do arquivo de dados na estrutura
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    var isFavorite: Bool
    
    //ler o nome da imagem na base de dados
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //gerenciar as coordenadas
    
    private var coordinates: Coordinates
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
