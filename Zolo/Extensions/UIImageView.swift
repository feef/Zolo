//
//  UIImageView.swift
//  Zolo
//
//  Created by sharif ahmed on 4/14/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {
    
    /// Sets the image by downloading it from the remote source, displaying a centered activity indicator until the image has finished loading.
    func setImage(with url: URL, completed: SDExternalCompletionBlock? = nil) {
        let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        loadingIndicator.startAnimating()
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        addSubview(loadingIndicator)
        loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        sd_setImage(with: url) { image, error, cacheType, url in
            loadingIndicator.removeFromSuperview()
            completed?(image, error, cacheType, url)
        }
    }
}
