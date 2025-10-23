//
//  TaskManagerApp.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-15.
//

import SwiftUI
import CoreData

@main
struct TaskManagerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
