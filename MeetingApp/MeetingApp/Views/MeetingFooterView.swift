//
//  MeetingFooterView.swift
//  MeetingApp
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-25.
//

import SwiftUI
import TimerKit

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker]
    var skipAction: ()->Void
    
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: { !$0.isCompleted }) else { return nil }
        return index + 1
    }
    
    var body: some View {
        HStack {
            Text("Speaker 1 of 3")
            Spacer()
            Button(action: {}) {
                Image(systemName: "forward.fill")
            }
            .accessibilityLabel("Next speaker")
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    @Previewable var speakers = DailyScrum.sampleData[0].attendees
            .map { $0.name }
            .map { ScrumTimer.Speaker(name: $0, isCompleted: false) }
    MeetingFooterView(speakers: speakers, skipAction: {})
}
