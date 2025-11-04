//
//  CircleImage.swift
//  Landmarks
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-12.
//

import SwiftUI

struct CircleImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .scaledToFit()
            .frame(width: 400, height: 250)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(Color.white, lineWidth: 8)
            }
            .shadow(color: .black, radius: 8)
        
            
    }
}

#Preview {
    CircleImage(image: Image("landmark1"))
}
