//
//  LanguageSelectorViewController.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class LanguageSelectorViewController: BaseViewController {
	var presenter: LanguageSelectorPresenterInput!
    var tableHandler: LanguageTableHandling!
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
    
    @objc private func didTapClose() {
        presenter.didTapClose()
    }

}

extension LanguageSelectorViewController: LanguageSelectorPresenterOutput {
    func setupNavBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
    }
    
    func setLanguages(_ data: [Language]) {
        tableHandler.setItems(data)
    }
    
    func setupTableActions(select: @escaping (Language) -> Void) {
        tableHandler.didSelectItem = select
    }
    
    func setupTableView() {
        tableHandler.attach(tableView)
    }

}
