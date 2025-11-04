//
//  RotateBadgeSymbol.swift
//  Landmarks
//
//  Created by Menikdiwela, Lahiru 588 on 2025-10-13.
//

import SwiftUI

struct RotateBadgeSymbol: View {
    let angle: Angle
    var body: some View {
        BadgeSymbol()
            .padding(-60)
            .rotationEffect(angle, anchor: .bottom)
    }
}

#Preview {
    RotateBadgeSymbol(angle: Angle(degrees: 5))
}
