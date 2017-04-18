//
//  KeyboardManager.swift
//  Zolo
//
//  Created by sharif ahmed on 4/14/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

/// An object that listens for changes in keyboard frame, transforming the response API from notification-based to block-based.
class KeyboardManager: NSObject {
    typealias KeyboardUpdateBlock = (CGRect) -> Void
    
    var onShow: KeyboardUpdateBlock?
    var onHide: KeyboardUpdateBlock?
    var onChangeFrame: KeyboardUpdateBlock?
    
    init(onShow: KeyboardUpdateBlock? = nil, onHide: KeyboardUpdateBlock? = nil, onChangeFrame: KeyboardUpdateBlock? = nil) {
        self.onShow = onShow
        self.onHide = onHide
        self.onChangeFrame = onChangeFrame
        super.init()
        NotificationCenter.default.addObserver(self, selector: #selector(willShow), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willHide), name: Notification.Name.UIKeyboardWillHide, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willChangeFrame), name: Notification.Name.UIKeyboardWillChangeFrame, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Notification Response
    
    private dynamic func willShow(notification: Notification) {
        getFrame(from: notification, andCall: onShow)
    }
    
    private dynamic func willHide(notification: Notification) {
        getFrame(from: notification, andCall: onHide)
    }
    
    private dynamic func willChangeFrame(notification: Notification) {
        getFrame(from: notification, andCall: onChangeFrame)
    }
    
    // MARK: - Helpers
    
    private func getFrame(from notification: Notification, andCall method: KeyboardUpdateBlock?) {
        guard
            let frame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
            let duration = (notification.userInfo?[UIKeyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue,
            let curveValue = (notification.userInfo?[UIKeyboardAnimationCurveUserInfoKey] as? NSNumber)?.intValue,
            let options = UIViewAnimationCurve(rawValue: curveValue)?.optionsValue
        else {
            return
        }
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            method?(frame)
        })
    }
}
