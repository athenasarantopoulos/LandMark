//
//  LandmarkRow.swift
//  LandMarks
//
//  Created by Athena Fernandes Sarantôpoulos on 15/07/21.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark //dados do json
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
            
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var landmarks = ModelData().landmarks
    static var previews: some View { //utilizando group para agrupar o conteudo da visualização
        Group {
            LandmarkRow(landmark: landmarks[0])
                // parecer como uma linha de uma lista
            LandmarkRow(landmark: landmarks[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
