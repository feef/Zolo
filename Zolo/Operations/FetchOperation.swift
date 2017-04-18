//
//  FetchOperation.swift
//  Zolo
//
//  Created by sharif ahmed on 4/14/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import Foundation

/// An operation subclass that aids in the generation of fetch data tasks.
class FetchOperation<Model>: Operation {
    typealias Completion = (FetchOperationResult<Model>) -> Void
    typealias DataTaskCompletion = (Data?, URLResponse?, Error?) -> Void
    let onComplete: Completion
    init(onComplete: @escaping Completion) {
        self.onComplete = onComplete
        super.init()
    }
    
    func dataTask(withPath path: String, parameters: [String: String], completionHandler: @escaping DataTaskCompletion) -> URLSessionDataTask? {
        var components = URLComponents(string: "http://api-public.guidebox.com")
        components?.path = "/v2/\(path)"
        var queryItems = [URLQueryItem]()
        for (name, value) in parameters {
            queryItems.append(URLQueryItem(name: name, value: value))
        }
        queryItems.append(URLQueryItem.authorization)
        components?.queryItems = queryItems
        guard let url = components?.url else {
            return nil
        }
        return URLSession.shared.dataTask(with: url, completionHandler: completionHandler)
    }
}
