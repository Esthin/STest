//
//  LanguageTableHandling.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

protocol LanguageTableHandling {
    func attach(_ tableView: UITableView)
    func setItems(_ items: [Language])
    var didSelectItem: ((Language) -> Void)? { get set }
}
