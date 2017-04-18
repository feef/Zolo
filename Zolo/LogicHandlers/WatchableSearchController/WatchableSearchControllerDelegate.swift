//
//  WatchableSearchControllerDelegate.swift
//  Zolo
//
//  Created by sharif ahmed on 4/18/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import Foundation

/// Describes an object that will respond to changes in a `WatchableSearchController`'s state.
protocol WatchableSearchControllerDelegate: class {
    func watchableSearchController(_ watchableSearchController: WatchableSearchController, updatedTo state: WatchableSearchControllerState)
}
