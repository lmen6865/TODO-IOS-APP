//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-10.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @State private var modelData = ModelData()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
        }
    }
}
