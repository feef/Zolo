//
//  WatchablePoster.swift
//  Zolo
//
//  Created by sharif ahmed on 4/14/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

/// Metadata of an image used to represent a piece of media.
struct WatchablePoster: Equatable {
    var url: URL
    var size: CGSize
}

// MARK: - Equatable

func ==(lhs: WatchablePoster, rhs: WatchablePoster) -> Bool {
    return lhs.url == rhs.url && lhs.size == rhs.size
}
