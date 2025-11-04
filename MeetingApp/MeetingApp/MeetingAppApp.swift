//
//  MeetingAppApp.swift
//  MeetingApp
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-25.
//

import SwiftUI
import CoreData

@main
struct MeetingAppApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
                
        }
    }
}
