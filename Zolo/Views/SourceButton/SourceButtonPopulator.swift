//
//  SourceButtonPopulator.swift
//  Zolo
//
//  Created by sharif ahmed on 4/14/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

struct SourceButtonPopulator {
    static func populate(_ sourceButton: SourceButton, with watchableSource: WatchableSource) {
        sourceButton.watchableSource = watchableSource
        sourceButton.setImage(watchableSource.thumbnailImage, for: .normal)
        sourceButton.layer.cornerRadius = 6
        sourceButton.clipsToBounds = true
    }
}
