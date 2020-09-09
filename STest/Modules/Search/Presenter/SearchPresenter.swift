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
    }
    
}

extension SearchPresenter: SearchPresenterInput {
    func didTapSourceLanguage() {
        
    }
    
    func didTapTargetLanguage() {
        
    }
    
    func didEnterText(text: String?) {
        guard let text = text else { return }
        interactor.fetchTranslate(for: text)
    }
}

extension SearchPresenter: SearchInteractorOutput {
    func didReceiveTranslateResponse(with result: Result<TranslateResponse, NetworkError>) {
        switch result {
        case .success(let response):
            // TODO
            break
        case .failure(let error):
            // TODO
            break
        }
    }
    
    
}


