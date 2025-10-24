//
//  FavoriteSectionView.swift
//  TaskManager
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-23.
//

import SwiftUI

struct FavoriteSectionView: View {
    @Binding var selection: TaskSelection?
    
    var body: some View {
        Picker("Task Type", selection: $selection) {    ForEach(TaskSelection.allCases, id: \.self) { selection in        Text(selection.displayName)
                .tag(selection as TaskSelection?)
        }}
        .pickerStyle(SegmentedPickerStyle())
        .padding()
    }
}

#Preview {
    FavoriteSectionView(selection: .constant(.all))
}
