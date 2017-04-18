//
//  UIViewAnimationCurve.swift
//  Zolo
//
//  Created by sharif ahmed on 4/14/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

extension UIViewAnimationCurve {
    var optionsValue: UIViewAnimationOptions {
        return UIViewAnimationOptions(rawValue: UInt(rawValue << 16))
    }
}
