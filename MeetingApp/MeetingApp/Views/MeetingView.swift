//
//  MeetingView.swift
//  MeetingApp
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-25.
//

import SwiftUI
import ThemeKit
import TimerKit

struct MeetingView: View {
    @Binding var scrum: DailyScrum
    @State var scrumTimer = ScrumTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16.0)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed,
                                                  secondsRemaining: scrumTimer.secondsRemaining,
                                                  theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth: 24)
                HStack {
                    Text("Speaker 1 of 3")
                    Spacer()
                    Button(action: {}) {
                        Image(systemName: "forward.fill")
                    }
                }
            }
            .padding()
            .foregroundColor(scrum.theme.accentColor)
            .onAppear {
                scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendeeNames: scrum.attendees.map { $0.name })
                scrumTimer.startScrum()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    @Previewable @State var scrum = DailyScrum.sampleData[0]
    MeetingView(scrum: $scrum)
}
