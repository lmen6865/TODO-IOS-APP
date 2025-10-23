//
//  TaskDetail.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-17.
//

import SwiftUI
import CoreData

struct TaskDetail: View {
    @ObservedObject var task: TaskEntity
    @Environment(\.managedObjectContext) var context
    @StateObject private var viewModel = TaskDetailViewModel()
    
    @State private var showSaveErrorAlert = false
    
    var body: some View {
        List {
            TextField("Title", text: $task.title)
                .font(.title2)
                .bold()
            
            Toggle(task.isCompleted ? "Completed" : "Pending", isOn: $task.isCompleted)
            
            DatePicker("Due Date", selection: $task.dueDate, displayedComponents: [.date, .hourAndMinute])
                .datePickerStyle(.graphical)
            
            TextField("Details", text: $task.details)
            
            Picker("Group", selection: Binding(get: {
                task.group
            }, set: { newGroup in
                task.group = newGroup
            })) {
                ForEach(viewModel.groups, id: \.self) { group in
                    Text(group.title).tag(group as TaskGroupEntity?)
                }
            }
        }
        .onAppear {
            viewModel.setContext(context)
        }
        .onDisappear {
            do {
                try context.save()
            } catch {
                showSaveErrorAlert = true
            }
        }
        .alert("Save Failed", isPresented: $showSaveErrorAlert) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("There was a problem saving your changes. Please try again.")
        }
    }
}
#Preview {
    TaskDetail(task: .example)
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
