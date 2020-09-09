//
//  SearchRouting.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol SearchRouting: BaseRouting {
    func presentLanguageSelector(_ completion: @escaping (Language?) -> Void)
}
