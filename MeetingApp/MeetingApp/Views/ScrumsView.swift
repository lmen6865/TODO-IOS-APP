//
//  ScrumsView.swift
//  MeetingApp
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-25.
//

import SwiftUI
import ThemeKit

struct ScrumsView: View {
    @Binding var scrums: [DailyScrum]
  
    var body: some View {
        NavigationStack {
            List($scrums) { $scrum in
                NavigationLink(destination: DetailView(scrum: $scrum)) {
                    CardView(scrum: scrum)
                }
                .listRowBackground(scrum.theme.mainColor)
            }
            .navigationTitle("Daily Scrums")
            .toolbar {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("New Scrum")
            }
        }
    }
}


#Preview {
    @Previewable @State var scrums = DailyScrum.sampleData
    ScrumsView(scrums: $scrums)
}
