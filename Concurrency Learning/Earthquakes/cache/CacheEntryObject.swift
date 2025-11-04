//
//  CacheEntryObject.swift
//  Earthquakes
//
//  Created by Menikdiwela, Lahiru 588 on 2025-11-02.
//

import Foundation


final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}


enum CacheEntry {
    case inProgress(Task<QuakeLocation, Error>)
    case ready(QuakeLocation)
}
