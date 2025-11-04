//
//  QuakeDetailMap.swift
//  Earthquakes
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-02.
//
import SwiftUI
import MapKit


struct QuakeDetailMap: View {
    let location: QuakeLocation
    let tintColor: Color
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        Map(position: $position)
            .onAppear {
                withAnimation {
                    var region = MKCoordinateRegion()
                    region.center = CLLocationCoordinate2D(latitude: -30.0, longitude: 130.0)
                    region.span = MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 70)
                    position = .region(region)
                }
            }
    }
}
   
