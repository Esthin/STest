//
//  StorageReceiver.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation
import CoreData

protocol StorageReceiver {
    func fetch(for entity: String) -> [NSManagedObject]
}

