//
//  HistoryPresenter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class HistoryPresenter {
    private let router: HistoryRouting
    private let interactor: HistoryInteractorInput
    private unowned var view: HistoryPresenterOutput!
    
    init(_ router: HistoryRouting, _ interactor: HistoryInteractorInput,_ view: HistoryPresenterOutput) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }

    func viewDidLoad() {
        interactor.attach(self)
        view.setupNavBar()
        view.setupTableView()
    }
    
}

extension HistoryPresenter: HistoryPresenterInput {
    
}

extension HistoryPresenter: HistoryInteractorOutput {
    
}


