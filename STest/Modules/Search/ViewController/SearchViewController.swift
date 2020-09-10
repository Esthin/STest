//
//  SearchViewController.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

final class SearchViewController: BaseViewController {
    
    @IBOutlet private weak var inputTextView: UITextView!
    @IBOutlet private weak var outputTextView: UITextView!
    var presenter: SearchPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    @objc
    private func hitsFromTextView(textView: UITextView) {
        presenter.didEnterText(text: textView.text)
    }
    
}

extension SearchViewController: SearchPresenterOutput {
    func setInput(_ input: String?) {
        inputTextView.text = input
    }
    
    func setTranslate(_ translate: String?) {
        outputTextView.text = translate
    }
    
    func setup() {
        inputTextView.delegate = self
        view.backgroundColor = .yellow
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        view.addGestureRecognizer(tap)
//        navigationController?.navigationBar.addGestureRecognizer(tap)
    }
    
    func setSourceLanguageTitle(_ title: String) {
        (navigationController?.navigationBar as? NavigationBar)?.setLeftButtonTitle(title)
    }
    
    func setTargetLanguageTitle(_ title: String) {
        (navigationController?.navigationBar as? NavigationBar)?.setRightButtonTitle(title)
    }
    
    func setupLeftNavBarAction(_ action: (() -> Void)?) {
        (navigationController?.navigationBar as? NavigationBar)?.leftButtonAction = action
    }
    
    func setupRightNavBarAction(_ action: (() -> Void)?) {
        (navigationController?.navigationBar as? NavigationBar)?.rightButtonAction = action
    }
    
}

extension SearchViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        guard let textView = inputTextView else { return false }
        NSObject.cancelPreviousPerformRequests(withTarget:self,selector:#selector(SearchViewController.hitsFromTextView),object: textView)
        self.perform(#selector(SearchViewController.hitsFromTextView),with:textView,afterDelay: 0.75)
        return true
    }
}

