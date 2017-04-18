//
//  WatchableSearchControllerState.swift
//  Zolo
//
//  Created by sharif ahmed on 4/18/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import Foundation

/// Describes what is represented by items within a `WatchableSearchController`.
enum WatchableSearchControllerState: Equatable {
    case noResults
    case noSearch
    case failed
    case searching
    case populated(visibleItems: [Watchable])
    
    /// Whether or not this state contains items that can be displayed.
    var hasVisibleItems: Bool {
        switch self {
        case .noResults, .noSearch, .searching, .failed:
            return false
        case .populated(let watchables):
            return !watchables.isEmpty
        }
    }
}

// MARK: - Equatable

func ==(lhs: WatchableSearchControllerState, rhs: WatchableSearchControllerState) -> Bool {
    switch(lhs, rhs) {
    case (.noResults, .noResults):
        return true
    case (.noSearch, .noSearch):
        return true
    case (.searching, .searching):
        return true
    case (.populated(let watchables1), .populated(let watchables2)):
        return watchables1 == watchables2
    default:
        return false
    }
}
