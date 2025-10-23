//
//  FrontPageView.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-20.
//

import SwiftUI
import CoreData

struct FrontPageView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: TaskGroupEntity.fetch(), animation: .bouncy)
    var taskGroups: FetchedResults<TaskGroupEntity>
    
    @Binding var selection: TaskSelection?
    
    var body: some View {
        List(selection: $selection) {
            Section(header: Text("Favorites")
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.primary)){
                ForEach(TaskSelection.allCases) { selection in
                    Label(selection.displayName,
                          systemImage: selection.iconName)
                    .tag(selection)
                }
            }
            
            
            Section( header: Text("Your Groups")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)){
                    ForEach(taskGroups) { group in
                        TaskGroupRow(taskGroup: group)
                            .tag(TaskSelection.list(group))
                            .contextMenu {
                                Button("Delete", role: .destructive) {
                                    TaskGroupEntity.delete(taskGroup: group)
                                }
                            }
                    }
            }
            
        }
        .listStyle(.insetGrouped)
        Button(action: {
            withAnimation {
                let _ = TaskGroupEntity(title: "New", context: context)
            }}) {
                Label("Add Group", systemImage: "plus.circle.fill")
                    .font(.headline)
                    .padding()
                    
                
                    
            }
            .buttonStyle(.borderedProminent)
        
    }
}

#Preview {
    FrontPageView(selection: .constant(.all))
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
