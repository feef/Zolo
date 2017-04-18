//
//  FetchOperationError.swift
//  Zolo
//
//  Created by sharif ahmed on 4/18/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import Foundation

/// Local errors that could result from attempting a `FetchOperation`.
enum FetchOperationError: Error {
    case parsing
    case urlConstruction
    case apiError(description: String)
}
