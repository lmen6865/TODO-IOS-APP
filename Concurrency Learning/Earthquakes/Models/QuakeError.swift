//
//  QuakeError.swift
//  Earthquakes
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-01.
//

import Foundation


enum QuakeError: Error {
    case missingData
    case networkError
    case unexpectedError
}


extension QuakeError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString(
                "Found and will discard a quake missing a valid code, magnitude, place, or time.",
                comment: "")
        case .networkError:
            return NSLocalizedString(
                "A network error occurred. Please try again.",
                comment: "")
        case .unexpectedError:
            return NSLocalizedString(
                "An unexpected error occurred. Please try again.",
                comment: "")
        }
    }
}
