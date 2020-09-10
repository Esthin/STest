//
//  LanguageTableHandler.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class LanguageTableHandler: NSObject {
    private weak var tableView: UITableView!
    private var data: [Language] = []
    var didSelectItem: ((Language) -> Void)?
}

extension LanguageTableHandler: LanguageTableHandling {
    func attach(_ tableView: UITableView) {
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setItems(_ items: [Language]) {
        data = items
        tableView.reloadData()
    }
    
}

extension LanguageTableHandler: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = data[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(data[indexPath.row])
    }

}
