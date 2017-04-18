//
//  WatchableSource.swift
//  Zolo
//
//  Created by sharif ahmed on 4/12/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

/// Connects a visual representation (`thumbnailImage`) to a URL (`link`) representing a location on the internet where a particular piece of media can be found.
struct WatchableSource: Equatable {
    var thumbnailImage: UIImage
    var link: URL
    
    // TODO: Add init from json once we have an API that returns these objects
    
    // TODO: Remove this fake model array
    static let fakeSources = [
        WatchableSource(thumbnailImage: #imageLiteral(resourceName: "apple"), link: URL(string:"http://www.apple.com")!),
        WatchableSource(thumbnailImage: #imageLiteral(resourceName: "hulu"), link: URL(string:"http://www.hulu.com")!),
        WatchableSource(thumbnailImage: #imageLiteral(resourceName: "netflix"), link: URL(string:"http://www.netflix.com")!),
        WatchableSource(thumbnailImage: #imageLiteral(resourceName: "amazon"), link: URL(string:"http://www.amazon.com")!)
    ]
}

// MARK: - Equtable

func ==(lhs: WatchableSource, rhs: WatchableSource) -> Bool {
    return lhs.thumbnailImage == rhs.thumbnailImage && lhs.link == rhs.link
}
