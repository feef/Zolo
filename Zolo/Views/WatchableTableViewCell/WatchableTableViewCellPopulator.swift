//
//  WatchableTableViewCellPopulator.swift
//  Zolo
//
//  Created by sharif ahmed on 4/13/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit
import SDWebImage

/// Methods in this class encapsulate logic for displaying a `Watchable` inside a `WatchableTableViewCell`.
struct WatchableTableViewCellPopulator {
    private static let interSourceSpacing: CGFloat = 4
    
    static func populate(_ cell: WatchableTableViewCell, with watchable: Watchable) {
        if let url = watchable.posterImageURL(withMinimumSize: cell.posterImageView.bounds.size, inScreenWithScale: Int(UIScreen.main.scale)) {
            cell.posterImageView.setImage(with: url)
        } else {
            cell.posterImageView.image = nil
        }
        cell.titleLabel.text = watchable.title
        cell.descriptionLabel.text = watchable.description
        cell.yearLabel.text = watchable.releaseYear
        let sourceButtons = add(watchable.sources, to: cell.sourcesScrollView)
        cell.sourceButtons = sourceButtons
    }
    
    static func add(_ sources: [WatchableSource], to scrollView: UIScrollView) -> [SourceButton] {
        scrollView.removeAllSubviews()
        var sourceButtons = [SourceButton]()
        let sourceSideLength = scrollView.bounds.size.height
        for source in sources {
            let sourceButton = SourceButton(type: .custom)
            SourceButtonPopulator.populate(sourceButton, with: source)
            sourceButton.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(sourceButton)
            sourceButton.heightAnchor.constraint(equalTo: sourceButton.widthAnchor, multiplier: 1).isActive = true
            sourceButton.widthAnchor.constraint(equalToConstant: sourceSideLength).isActive = true
            if let lastAddedView = sourceButtons.last {
                sourceButton.leadingAnchor.constraint(equalTo: lastAddedView.trailingAnchor, constant: interSourceSpacing).isActive = true
            } else {
                sourceButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
            }
            sourceButton.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            sourceButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
            sourceButtons.append(sourceButton)
        }
        sourceButtons.last?.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        return sourceButtons
    }
}
