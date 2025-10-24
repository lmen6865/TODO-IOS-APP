//
//  TaskGroupRow.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-16.
//

import SwiftUI
import CoreData

struct TaskGroupRow: View {
    
    @StateObject private var viewModel: TaskGroupViewModel
    @Environment(\.managedObjectContext) var context
    @ObservedObject var taskGroup: TaskGroupEntity
    
    init(taskGroup: TaskGroupEntity) {
        _viewModel = StateObject(wrappedValue: TaskGroupViewModel())
        self.taskGroup = taskGroup
    }
    
    var body: some View {
        HStack {
            Image(systemName: "folder")
            Text(viewModel.title)
        }
        .onAppear {
            viewModel.setContext(taskGroup: taskGroup , context: context)
        }
    }
}

#Preview {
    TaskGroupRow(taskGroup: .example)
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
