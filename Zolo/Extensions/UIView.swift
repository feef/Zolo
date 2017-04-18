//
//  UIView.swift
//  Zolo
//
//  Created by sharif ahmed on 4/14/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

extension UIView {
    func removeAllSubviews() {
        subviews.forEach { $0.removeFromSuperview() }
    }
}
