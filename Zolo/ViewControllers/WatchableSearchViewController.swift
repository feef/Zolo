//
//  ViewController.swift
//  Zolo
//
//  Created by sharif ahmed on 4/12/17.
//  Copyright © 2017 Feef Anthony. All rights reserved.
//

import UIKit

/// This view controller displays a search bar, loading states, and search results (in the form of `Watchable` objects) constructed from data returned from a remote source.
class WatchableSearchViewController: UIViewController, WatchableSearchControllerDelegate, UIScrollViewDelegate {
    
    // MARK: - Outlets
    
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var backgroundContainerView: UIView!
    @IBOutlet private var backgroundContainerToBottomConstraint: NSLayoutConstraint!
    
    // MARK: - Background Views
    
    private let noResultsLabel: UILabel = {
        let noResultsLabel = UILabel()
        noResultsLabel.text = NSLocalizedString("No Results", comment: "Denotes that there are no results of the current search")
        noResultsLabel.textColor = .white
        return noResultsLabel
    }()
    private let searchFailureLabel: UILabel = {
        let searchFailureLabel = UILabel()
        searchFailureLabel.text = NSLocalizedString("Search failed, please try again", comment: "Denotes that we encountered an error on attempting the search")
        searchFailureLabel.textColor = .white
        return searchFailureLabel
    }()
    private let logoImageView = UIImageView(image: #imageLiteral(resourceName: "zoloLogo"))
    private let loadingIndicator: UIActivityIndicatorView = {
        let loadingIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        loadingIndicator.startAnimating()
        return loadingIndicator
    }()
    
    // MARK: - Objects Requiring Loaded View
    
    private var keyboardManager: KeyboardManager!
    private var searchController: WatchableSearchController!
    
    // MARK: - Logic
    
    private var isFirstAppearance: Bool = true
    
    // MARK: - Convenience Accessors
    
    private var selfIfViewLoaded: WatchableSearchViewController? {
        guard isViewLoaded else {
            return nil
        }
        return self
    }
    
    // MARK: - UIViewController overrides
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        let searchController = WatchableSearchController(tableView, searchBar)
        searchController.delegate = self
        self.searchController = searchController
        weak var weakSelf = self
        keyboardManager = KeyboardManager(onShow: weakSelf?.keyboardUpdated, onHide: weakSelf?.keyboardUpdated, onChangeFrame: weakSelf?.keyboardUpdated)
        updateBackground(for: .noSearch)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isFirstAppearance {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
                self?.searchBar.becomeFirstResponder()
            }
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Keyboard Change
    
    private dynamic func keyboardUpdated(to frame: CGRect) {
        /// The `backgroundContainerToBottomConstraint` is setup such that it takes up the entire screen.
        /// To center the view contained inside the container within the view remaining once the keyboard is visible, we need to remove the height of the topLayoutGuide and searchbar
        let offsetHeight = self.view.bounds.intersection(frame).height - searchBar.bounds.height - topLayoutGuide.length
        backgroundContainerToBottomConstraint.constant = max(0, offsetHeight)
        view.layoutIfNeeded()
    }
    
    // MARK: - WatchableSearchControllerDelegate
    
    func watchableSearchController(_ watchableSearchController: WatchableSearchController, updatedTo state: WatchableSearchControllerState) {
        guard let safeSelf = selfIfViewLoaded else {
            return
        }
        safeSelf.tableView.isHidden = !state.hasVisibleItems
        if !state.hasVisibleItems {
            searchBar.becomeFirstResponder()
        }
        updateBackground(for: state)
        safeSelf.tableView.reloadData()
    }
    
    // MARK: - WatchableSearchControllerState Change
    
    private func background(for state: WatchableSearchControllerState) -> UIView? {
        let backgroundView: UIView?
        switch state {
            case .noSearch:
                backgroundView = logoImageView
            case .noResults:
                backgroundView = noResultsLabel
            case .searching:
                backgroundView = loadingIndicator
            case .failed:
                backgroundView = searchFailureLabel
            case .populated:
                backgroundView = nil
        }
        return backgroundView
    }
    
    private func updateBackground(for state: WatchableSearchControllerState) {
        backgroundContainerView.removeAllSubviews()
        guard let backgroundView = background(for: state) else {
            return
        }
        backgroundContainerView.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.centerXAnchor.constraint(equalTo: backgroundContainerView.centerXAnchor).isActive = true
        backgroundView.centerYAnchor.constraint(equalTo: backgroundContainerView.centerYAnchor).isActive = true
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
