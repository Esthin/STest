//
//  SearchPresenterOutput.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import Foundation

protocol SearchPresenterOutput: class {
    func setup()
    func setupLeftNavBarAction(_ action: (() -> Void)?)
    func setupRightNavBarAction(_ action: (() -> Void)?)
    func setSourceLanguageTitle(_ title: String)
    func setTargetLanguageTitle(_ title: String)
    func setTranslate(_ translate: String)
    func showLoader()
    func hideLoader()
}
