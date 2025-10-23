//
//  TaskRow.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-17.
//

import SwiftUI

struct TaskItem: View {
    @ObservedObject var task: TaskEntity
    @Binding var selectedTask: TaskEntity?
    @Binding var detailIsShown: Bool
    
    
    
    init(task: TaskEntity, selectedTask: Binding<TaskEntity?>,
         detailIsShown: Binding<Bool>) {
        self.task = task
        self._selectedTask = selectedTask
        self._detailIsShown = detailIsShown

    }

    
    var body: some View {
        HStack {
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .font(.title2)
                .onTapGesture {
                    withAnimation {
                        task.isCompleted.toggle()
                    }
                    
                }
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
                .font(.body)
            
            
            
            Button(action: {
                detailIsShown = true
                selectedTask = task
            }) {
                Label("More", systemImage: "ellipsis.circle")
                    .labelStyle(.iconOnly)
                    .font(.title2)
                    .foregroundColor(.blue)
            }
            .buttonStyle(.plain)
            
        }
        
    }
}

#Preview {
    TaskItem(task: TaskEntity.example,
             selectedTask: .constant(nil),
             detailIsShown: .constant(false))
    .padding()
}
