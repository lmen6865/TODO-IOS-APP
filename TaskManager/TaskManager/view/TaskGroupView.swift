//
//  FrontPageView.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-20.
//

import SwiftUI
import CoreData

struct TaskGroupView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: TaskGroupEntity.fetch(), animation: .bouncy)
    
    var taskGroups: FetchedResults<TaskGroupEntity>
    
    var body: some View {
        NavigationStack {
            List {
                
                Section(header: Text("Groups")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)) {
                        
                        ForEach(taskGroups) { group in
                            NavigationLink {
                                TaskListView(viewModel: TaskListViewModel(selection: .list(group)))
                            }
                        label: {
                            TaskGroupRow(taskGroup: group)
                        }
                           
                        .contextMenu {
                            Button("Delete", role: .destructive) {
                                TaskGroupEntity.delete(taskGroup: group)
                            }
                        }
                    }
                    }
                
            }
            .listStyle(.inset)
        }
        
        .toolbar {
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    withAnimation {
                        let _ = TaskGroupEntity(title: "New", context: context)
                    }
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                        Text("Add Group")
                            .font(.headline)
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                }
                .buttonStyle(.plain)
            }
        }
        
    }
}
    

#Preview {
    TaskGroupView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
