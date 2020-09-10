//
//  SearchPresenterInput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol SearchPresenterInput: BasePresenting {
    func didEnterText(text: String?)
}
