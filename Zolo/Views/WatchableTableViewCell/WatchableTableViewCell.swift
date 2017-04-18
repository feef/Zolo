//
//  WatchableTableViewCell.swift
//  Zolo
//
//  Created by sharif ahmed on 4/12/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

/// A cell for displaying the contents of a `Watchable`.
class WatchableTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "WatchableTableViewCell"
    static let associatedNib: UINib = UINib(nibName: reuseIdentifier, bundle: nil)
    static let preferredHeight: CGFloat = 182
    
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var sourcesScrollView: UIScrollView!
    
    /// The buttons added as subviews of this cell's `sourcesScrollView`
    var sourceButtons: [SourceButton] = []
}
