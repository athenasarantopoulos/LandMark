//
//  LandmarkDetail.swift
//  LandMarks
//
//  Created by Athena Fernandes Sarantôpoulos on 15/07/21.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    
    //ponto de referencia do landmark selecionado $0 is the first parameter passed into the closure
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where : {$0.id == landmark.id})!
    }
    
    var body: some View {
        ScrollView {
            //colocando o mapa
            MapView(coordinate: landmark.locationCoordinate)
                .ignoresSafeArea(edges: .top) // para estender o mapa ate a borda
                .frame(height: 300)
            // colocando a imagem circular
            CircleImage(image: landmark.image)//atributos para deixar em cima do mapa
                .offset(y: -130)
                .padding(.bottom, -130)
            
            //colocando os textos
            VStack(alignment: .leading) {
                Text(landmark.name)
                    .font(.title)
                    .foregroundColor(.primary)
                FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                        
                }// colocar as font aqui para mudar todos dentro da pilha
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                Text(landmark.description)
            }
            .padding()
            
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
    }
}
