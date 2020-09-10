//
//  HistoryTableHandler.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class HistoryTableHandler: NSObject {
    private weak var tableView: UITableView!
    private var data: [HistoryItemModel] = []
    var didSelectItem: ((HistoryItemModel) -> Void)?
}

extension HistoryTableHandler: HistoryTableHandling {
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.register(HistoryTableViewCell.self, forCellReuseIdentifier: String(describing: HistoryTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setItems(_ items: [HistoryItemModel]) {
        data = items
        tableView.reloadData()
    }
    
}

extension HistoryTableHandler: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HistoryTableViewCell.self)) as? HistoryTableViewCell
        cell?.setData(data[indexPath.row])
        return cell ?? .init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(data[indexPath.row])
    }

}
