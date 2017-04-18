//
//  WatchableSearchController.swift
//  Zolo
//
//  Created by sharif ahmed on 4/12/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

class WatchableSearchController: NSObject, UISearchBarDelegate, UITableViewDataSource {
    
    // MARK: - Public Properties
    
    weak var delegate: WatchableSearchControllerDelegate?
    
    // MARK: - Private properties
    
    private var searchResults = [Watchable]()
    private var currentFetchOperation: FetchWatchablesOperation?
    private var currentSearchTerm: String?
    
    // MARK: - Initialization
    
    init(_ tableView: UITableView, _ searchBar: UISearchBar) {
        super.init()
        tableView.register(WatchableTableViewCell.associatedNib, forCellReuseIdentifier: WatchableTableViewCell.reuseIdentifier)
        tableView.rowHeight = WatchableTableViewCell.preferredHeight
        tableView.backgroundColor = .black
        tableView.dataSource = self
        searchBar.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WatchableTableViewCell.reuseIdentifier) as! WatchableTableViewCell
        WatchableTableViewCellPopulator.populate(cell, with: searchResults[indexPath.row])
        cell.sourceButtons.forEach { $0.addTarget(self, action: #selector(tappedSourceButton(_:)), for: .touchUpInside) }
        return cell
    }
    
    // MARK: - Button Tap Response
        
    dynamic private func tappedSourceButton(_ button: SourceButton) {
        guard let link = button.watchableSource?.link else {
            return
        }
        UIApplication.shared.open(link, options: [:], completionHandler: nil)
    }
    
    // MARK: - UISearchBarDelegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        currentSearchTerm = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard
            let currentSearchTerm = currentSearchTerm,
            !currentSearchTerm.characters.isEmpty
            else {
                return
        }
        currentFetchOperation?.cancel()
        delegate?.watchableSearchController(self, updatedTo: .searching)
        let fetchOperation = FetchWatchablesOperation(searchTerm: currentSearchTerm) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            DispatchQueue.main.async {
                switch result {
                    case .success(let watchables):
                        strongSelf.searchResults = watchables
                        if !watchables.isEmpty {
                            searchBar.resignFirstResponder()
                            strongSelf.delegate?.watchableSearchController(strongSelf, updatedTo: .populated(visibleItems: strongSelf.searchResults))
                        } else {
                            strongSelf.delegate?.watchableSearchController(strongSelf, updatedTo: .noResults)
                        }
                    case .failure(let error):
                        strongSelf.searchResults = []
                        strongSelf.delegate?.watchableSearchController(strongSelf, updatedTo: .failed)
                        // TODO: Replace with performant, remotely-visible logger
                        NSLog(error.localizedDescription)
                }
            }
        }
        currentFetchOperation = fetchOperation
        OperationQueue.background.addOperation(fetchOperation)
    }
}
