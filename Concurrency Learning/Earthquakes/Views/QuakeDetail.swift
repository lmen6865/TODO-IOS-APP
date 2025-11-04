//
//  QuakeDetail.swift
//  Earthquakes
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-02.
//

import SwiftUI

struct QuakeDetail: View {
    let quake: Quake
    @Environment(QuakesProvider.self) private var quakesProvider
    @State private var location: QuakeLocation? = nil
    
    var body: some View {
        VStack {
            if let location = self.location {
                    QuakeDetailMap(location: location, tintColor: quake.color)
                        .ignoresSafeArea(.container)
                }
            QuakeMagnitude(quake: quake)
            Text(quake.place)
                .font(.title3)
                .bold()
            Text("\(quake.time.formatted())")
                .foregroundStyle(Color.secondary)
            if let location {
                Text("Latitude: \(location.latitude.formatted(.number.precision(.fractionLength(3))))")
                Text("Longitude: \(location.longitude.formatted(.number.precision(.fractionLength(3))))")
            }
        }
        .task {
                if location == nil {
                    if let quakeLocation = quake.location {
                        location = quakeLocation
                    } else {
                        location = try? await quakesProvider.location(for: quake)
                    }
                }
            }
    }
}


#Preview {
    QuakeDetail(quake: Quake.preview)
        .environment(
                   QuakesProvider(client:
                                   QuakeClient(downloader: TestDownloader())))
}
