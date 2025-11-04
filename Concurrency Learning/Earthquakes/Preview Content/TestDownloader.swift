//
//  TestDownloader.swift
//  Earthquakes
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-02.
//

import Foundation


final class TestDownloader: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        try await Task.sleep(for: .milliseconds(.random(in: 100...500)))
        return testQuakesData
    }
}
