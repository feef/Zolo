//
//  FetchOperationResult.swift
//  Zolo
//
//  Created by sharif ahmed on 4/18/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import Foundation

/// The possible results of a `FetchOperation`.
enum FetchOperationResult<Model> {
    case success(Model)
    case failure(Error)
}
