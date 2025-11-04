//
//  HTTPDataDownloader.swift
//  Earthquakes
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-02.
//

import Foundation

let validStatus = 200...299

protocol HTTPDataDownloader: Sendable {
    func httpData(from: URL) async throws -> Data
}


extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw QuakeError.networkError
        }
        return data
    }
}
