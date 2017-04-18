//
//  Watchable.swift
//  Zolo
//
//  Created by sharif ahmed on 4/12/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit
import SwiftyJSON

/// A single piece of media that can be found via online streaming sources.
struct Watchable: Equatable {
    private static let posterKeyDetails = [
        (CGSize(width: 120, height: 171), "poster_120x171"),
        (CGSize(width: 240, height: 342), "poster_240x342"),
        (CGSize(width: 400, height: 570), "poster_400x570")
    ]
    
    var posters: [WatchablePoster]
    var title: String
    var releaseYear: String
    var description: String
    var sources: [WatchableSource]

    init?(json: JSON) {
        guard
            let title = json["title"].string,
            let releaseYear = json["release_year"].int
            else {
                return nil
        }
        
        self.title = title
        self.releaseYear = "\(releaseYear)"
        
        self.posters = Watchable.posterKeyDetails.flatMap { size, key -> WatchablePoster? in
            if let url = json[key].url {
                return WatchablePoster(url: url, size: size)
            }
            return nil
        }
        
        // TODO: Get these out of an actual response once we find an API that returns them
        let singleDescription = "API doesn't return a description. "
        let descriptionRepeats = arc4random() % 5
        var description = singleDescription
        for _ in 0..<descriptionRepeats {
            description += singleDescription
        }
        self.description = description
        let sourceRepeats = arc4random() % 12
        self.sources = (0..<sourceRepeats).flatMap { WatchableSource.fakeSources[Int($0) % WatchableSource.fakeSources.count] }
    }
    
    // MARK: - Convenience Accessors
    
    func posterImageURL(withMinimumSize minimumSize: CGSize, inScreenWithScale scale: Int) -> URL? {
        var largestPoster: WatchablePoster?
        for poster in posters {
            if
                poster.size.width > minimumSize.width &&
                poster.size.height > minimumSize.height {
                return poster.url
            }
            if let previousLargest = largestPoster {
                if poster.size.height > previousLargest.size.height {
                    largestPoster = poster
                }
            } else {
                largestPoster = poster
            }
        }
        return largestPoster?.url
    }
}

// MARK: - Equatable

func ==(lhs: Watchable, rhs: Watchable) -> Bool {
    return lhs.posters == rhs.posters &&
        lhs.title == rhs.title &&
        lhs.releaseYear == rhs.releaseYear &&
        lhs.description == rhs.description &&
        lhs.sources == rhs.sources
}
