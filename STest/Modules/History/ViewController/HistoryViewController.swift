//
//  HistoryViewController.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class HistoryViewController: BaseViewController {
    var presenter: HistoryPresenterInput!
    var tableHandler: HistoryTableHandling!
    private var tableView: UITableView!
    
    override func loadView() {
        super.loadView()
        tableView = UITableView()
        view = tableView
    }
    
    private let serachController: UISearchController = {
        let serachController = UISearchController()
        return serachController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
    
    @objc private func didTapRemoveAll() {
        presenter.didTapDeleteHistory()
    }
}

extension HistoryViewController: HistoryPresenterOutput {

    func setupSearchController() {
        navigationItem.searchController = serachController
        navigationItem.hidesSearchBarWhenScrolling = false
        serachController.obscuresBackgroundDuringPresentation  = false
        serachController.searchBar.backgroundColor = .yellow
        serachController.searchBar.delegate = self
    }
    
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapRemoveAll))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    func setupTableView() {
        tableHandler.attach(tableView)
    }
    
    func setupTableActions(select: @escaping (HistoryItemModel) -> Void) {
        tableHandler.didSelectItem = select
    }
    
    func setHistoryData(_ data: [HistoryItemModel]) {
        tableHandler.setItems(data)
    }
    
}

extension HistoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter.didSearchText(searchBar.text)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        presenter.didSearchText(nil)
    }
}
