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
