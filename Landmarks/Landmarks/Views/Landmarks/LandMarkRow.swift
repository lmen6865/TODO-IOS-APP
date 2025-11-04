//
//  LandMarkRow.swift
//  Landmarks
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-12.
//

import SwiftUI

struct LandMarkRow: View {
    var landmark: Landmark
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
            }
        }
        
    }
}

#Preview("Turtle Rock") {
    let landmarks = ModelData().landmarks
    Group {
        LandMarkRow(landmark: landmarks[0])
        LandMarkRow(landmark: landmarks[1])
    }
}

