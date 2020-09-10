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
        view.setupTableActions {[weak self] data in
            self?.interactor.postTranslateNotification(data: data)
            self?.router.presentTranslate()
        }
    }
    
    func viewWillAppear() {
        interactor.getTranslateHistory()
    }
    
}

extension HistoryPresenter: HistoryPresenterInput {
    func didTapDeleteHistory() {
        interactor.postTranslateNotification(data: nil)
        interactor.clearHeastory()
    }
    
}

extension HistoryPresenter: HistoryInteractorOutput {
    func didReceiveHistory(data: [HistoryItemModel]) {
        view.setHistoryData(data)
    }
}


