//
//  SearchViewController.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    @IBOutlet weak var textField: UITextField!
	var presenter: SearchPresenterInput!

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    @objc
    private func getHintsFromTextField(textField: UITextField) {
        presenter.didEnterText(text: textField.text)
    }

}

extension SearchViewController: SearchPresenterOutput {
    
    func setTranslate(_ translate: String) {
        // TODO
    }
    
    func setup() {
        textField.delegate = self
    }
    
    func setSourceLanguageTitle(_ title: String) {
        // TODO
    }
    
    func setTargetLanguageTitle(_ title: String) {
        // TODO
    }

}

extension SearchViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
        replacementString string: String) -> Bool {
        guard textField == self.textField else { return false }
        NSObject.cancelPreviousPerformRequests(withTarget:self,selector:#selector(SearchViewController.getHintsFromTextField),object: textField)
        self.perform(#selector(SearchViewController.getHintsFromTextField),with:textField,afterDelay: 0.75)
        return true
    }
}
