//
//  StorageEntity.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol StorageEntity where Self: Encodable {
    var title: String { get }
}

