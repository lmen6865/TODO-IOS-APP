//
//  ContentView.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-15.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State private var selection: Tab = .featured
    enum Tab {
            case featured
            case groups
        }
    
    var body: some View {
        TabView(selection: $selection) {
            FeaturedListView()
                .tabItem {
                    Label("Featured", systemImage: "star")
                }
                .tag(Tab.featured)
            
            TaskGroupView()
                .tabItem {
                    Label("Groups", systemImage: "list.bullet")
                }
                .tag(Tab.groups)
        }
        
    }
}

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
