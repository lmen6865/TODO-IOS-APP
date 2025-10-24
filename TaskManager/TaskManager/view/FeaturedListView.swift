//
//  FeaturedViewList.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-23.
//


import SwiftUI
import CoreData

struct FeaturedListView: View {
    
    @Environment(\.managedObjectContext) var context
    @FetchRequest(fetchRequest: TaskGroupEntity.fetch(), animation: .bouncy)
    var taskGroups: FetchedResults<TaskGroupEntity>
    @StateObject var viewModel: TaskListViewModel = TaskListViewModel(selection: .all)
    
    var body: some View {

            VStack {
                Picker("category", selection: $viewModel.selection) {
                    ForEach(TaskSelection.allCases, id: \.self){ selection in
                        Text(selection.displayName)
                            .tag(selection)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
    
                
                TaskListView(viewModel: viewModel)
                    .transition(.opacity)
                    .animation(.easeInOut, value: viewModel.selection)
            }
    }
}

#Preview {
    FeaturedListView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
