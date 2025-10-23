//
//  ContentView.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var selection: TaskSelection? = nil
    @State private var searchTerm: String = ""
    
    var body: some View {
        NavigationSplitView {
            FrontPageView(selection: $selection)
                .navigationTitle("Your Tasks")
        } detail: {
            TaskListView(
                         selection: selection,
                         searchTerm: searchTerm)
        }
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
