//
//  BasePresenting.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol BasePresenting: class {
    func viewDidLoad()
    func viewDidLayoutSubviews()
    func viewWillAppear()
    func viewDidAppear()
    func viewWillDisappear()
    func viewDidDisappear()
}

extension BasePresenting {
    func viewDidLoad() {}
    func viewDidLayoutSubviews() {}
    func viewWillAppear() {}
    func viewDidAppear() {}
    func viewWillDisappear() {}
    func viewDidDisappear() {}
}
