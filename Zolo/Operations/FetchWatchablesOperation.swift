//
//  FetchWatchablesOperation.swift
//  Zolo
//
//  Created by sharif ahmed on 4/12/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit
import SwiftyJSON

/// Searches Guidebox for movies based on the provided search term, returning results as `Watchable` objects.
class FetchWatchablesOperation: FetchOperation<[Watchable]> {
    let searchTerm: String
    
    init(searchTerm: String, onComplete: @escaping Completion) {
        self.searchTerm = searchTerm
        super.init(onComplete: onComplete)
    }
    
    override func main() {
        let completion: DataTaskCompletion = { [weak self] data, response, fetchError in
            if
                self?.isCancelled == false,
                let data = data {
                let json = JSON(data)
                guard let watchableJSONArray = json["results"].array else {
                    let error: FetchOperationError
                    if let apiError = json["error"].string {
                        error = FetchOperationError.apiError(description: apiError)
                    } else {
                        error = FetchOperationError.parsing
                    }
                    self?.onComplete(.failure(error))
                    return
                }
                let watchables = watchableJSONArray.flatMap { Watchable(json: $0) }
                self?.onComplete(.success(watchables))
            } else {
                let error = fetchError ?? FetchOperationError.parsing
                self?.onComplete(.failure(error))
            }
        }
        guard let fetchTask = dataTask(withPath: "search", parameters: ["field": "title",  "type": "movie", "query": searchTerm], completionHandler: completion) else {
            onComplete(.failure(FetchOperationError.urlConstruction))
            return
        }
        fetchTask.resume()
    }
}
