//
//  TaskListView.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-19.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    
    @State var selectedTask: TaskEntity? = nil
//    
    @State var detailIsShown: Bool = false
    @Environment(\.managedObjectContext) var context
    @StateObject var viewModel: TaskListViewModel;
//    let selection: TaskSelection?
//    let searchTerm: String
//    @Binding var selection: TaskSelection
    var searchTerm = ""
//
    
//    init() {
//        _viewModel = StateObject(wrappedValue: TaskListViewModel())
//            
//        
//    }
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
                viewModel.fetchTasks(selection: viewModel.selection, searchTerm: searchTerm)
            }
            .listStyle(.inset)
            .navigationTitle(viewModel.selection.displayName)
            .toolbar{
                Picker("category", selection: $viewModel.selection) {
                    ForEach(TaskSelection.allCases, id: \.self){ selection in
                        Text(selection.displayName)
                            .tag(selection)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .toolbar {
                    Button {
                        withAnimation {
                            let _ = TaskEntity(title: "New", dueDate: Date(), context: context)
                            //                        task.group = group
                            PersistenceController.shared.save()
                            viewModel.fetchTasks(selection: viewModel.selection, searchTerm: searchTerm)
                        }
                    } label: {
                        Label("Add New Task", systemImage: "plus")
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
        viewModel:  TaskListViewModel(selection: .all)
    )
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
