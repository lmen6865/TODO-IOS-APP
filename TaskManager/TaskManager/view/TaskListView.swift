//
//  TaskListView.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-19.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    
    @State private var selectedTask: TaskEntity? = nil
//    
    @State private var detailIsShown: Bool = false
    @Environment(\.managedObjectContext) var context
    @StateObject private var viewModel: TaskListViewModel
    let selection: TaskSelection?
    let searchTerm: String
    
    
    init(selection: TaskSelection?, searchTerm: String) {
        self.selection = selection
        self.searchTerm = searchTerm
        _viewModel = StateObject(wrappedValue: TaskListViewModel())
            
        
    }
    var body: some View {
        NavigationSplitView {
            List(viewModel.tasks) { task in
                TaskItem(task: task,
                         selectedTask: $selectedTask,
                         detailIsShown: $detailIsShown)
                .foregroundColor(selectedTask == task ? .accentColor : .gray)
            }
            .onAppear {
                viewModel.setContext(context: context)
                viewModel.fetchTasks(selection: selection, searchTerm: searchTerm)
            }
            .navigationTitle(selection?.displayName ?? "All")
            .toolbar {
                ToolbarItemGroup {
                    Button {
                        withAnimation {
                            let _ = TaskEntity(title: "New", dueDate: Date(), context: context)
                            //                        task.group = group
                            PersistenceController.shared.save()
                            viewModel.fetchTasks(selection: selection, searchTerm: searchTerm)
                        }
                    } label: {
                        Label("Add New Task", systemImage: "plus")
                    }
                    
                
                }
            }
        }detail: {
            Text("Slect Category")
        }
        .sheet(isPresented: $detailIsShown) {
                    
                if let selectedTask {
                    TaskDetail(task: selectedTask)
                } else {
                    ContentUnavailableView("Please select a task",
                                           systemImage: "circle.inset.filled")
                }
                
            }

    }
}

#Preview {
    TaskListView(
                 selection: .all, searchTerm: "")
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
