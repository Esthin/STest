//
//  SearchPresenter.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

final class SearchPresenter {
    private let router: SearchRouting
    private let interactor: SearchInteractorInput
    private unowned var view: SearchPresenterOutput!
    
    init(_ router: SearchRouting, _ interactor: SearchInteractorInput,_ view: SearchPresenterOutput) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.attach(self)
        view.setup()
        view.setupLeftNavBarAction { [weak self] in
            self?.router.presentLanguageSelector { [weak self] lng in
                guard let lng = lng else { return }
                self?.interactor.setSourceLanguage(lng)
            }
        }
        view.setupRightNavBarAction { [weak self] in
            self?.router.presentLanguageSelector { [weak self] lng in
                guard let lng = lng else { return }
                self?.interactor.setTargetLanguage(lng)
            }
        }
    }
    
}

extension SearchPresenter: SearchPresenterInput {
    func didEnterText(text: String?) {
        guard let text = text, !text.isEmpty else { return }
        view.showLoader()
        interactor.fetchTranslate(for: text)
    }
}

extension SearchPresenter: SearchInteractorOutput {
    func didReceiveHistoryNotification(_ norification: NSNotification) {
        if let dict = norification.userInfo as NSDictionary? {
            let history = try? HistoryItemModel(from: dict)
            view.setInput(history?.source)
            view.setTranslate(history?.target)
        } else {
            view.setInput(nil)
            view.setTranslate(nil)
        }
    }
    
    func didChangeSourceLanguage(_ value: Language) {
        view.setSourceLanguageTitle(value.title)
    }
    
    func didChangeTargetLanguage(_ value: Language) {
        view.setTargetLanguageTitle(value.title)
    }
    
    func didReceiveTranslateResponse(with result: Result<TranslateResponse, NetworkError>, for word: String) {
        DispatchQueue.main.async {
            defer { self.view.hideLoader() }
            switch result {
            case .success(let response):
                guard let translate = response.outputs.first?.output else { return }
                self.view.setTranslate(translate)
                self.interactor.saveTranslate(source: word, result: translate)
            case .failure( _):
                self.view.setTranslate(nil)
            }
        }
    }

}


