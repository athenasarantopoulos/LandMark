//
//  ModelData.swift
//  LandMarks
//
//  Created by Athena Fernandes Sarantôpoulos on 15/07/21.
//

import Foundation

//model observavel O SwiftUI se inscreve em seu objeto observável e atualiza todas as visualizações que precisam ser atualizadas quando os dados são alterados.
final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    var hikes: [Hike] = load("hikeData.json")
    
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured } //somente os que sao verdadeiros os features
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: {$0.category.rawValue}
        )
    }
}

// matriz com os dados do arquivo json


// metodo para buscar dados json, depende da conformidade do tipo de retorno com o codableprotcolo

//decodable é Um tipo que pode se decodificar a partir de uma representação externa.

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Não é possivel achar o arquivo \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Não é possivel achar o arquivo \(filename). Erro \n\(error)")

    }
    
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Não é possivel achar o arquivo \(filename) \n\(error)")
    }
    
}
