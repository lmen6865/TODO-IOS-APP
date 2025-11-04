//
//  TrailingIconLabelStyle.swift
//  MeetingApp
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-25.
//
import SwiftUI

struct TrailingIconLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}


extension LabelStyle where Self == TrailingIconLabelStyle {
    static var trailingIcon: Self { Self() }
}
