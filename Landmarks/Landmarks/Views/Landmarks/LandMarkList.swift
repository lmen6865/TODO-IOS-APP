//
//  LandMarkList.swift
//  Landmarks
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-12.
//

import SwiftUI

struct LandMarkList: View {
    @Environment(ModelData.self) var modelData
    @State private var showFavoriteOnly: Bool = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter {Landmark in
            (!showFavoriteOnly || Landmark.isFavorite)}
    }
    var body: some View {
        NavigationSplitView {
            List{
                Toggle("Show Favorites Only", isOn: $showFavoriteOnly)
                ForEach(filteredLandmarks) {landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandMarkRow(landmark: landmark)
                    }
                }
            }
            .animation(.default, value: filteredLandmarks)
            .navigationTitle(Text("Landmarks"))
        } detail: {
            Text("select a landmark")
        }
    }
}

#Preview {
    LandMarkList()
}
