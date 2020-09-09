//
//  BaseViewController.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    private var loadingView: Loading!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoadingView()
    }
    
    private func setupLoadingView() {
        self.loadingView = LoadingView()
        view.addSubview(loadingView)
        loadingView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        loadingView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loadingView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func showLoader() {
        loadingView.showLoader()
    }
    
    func hideLoader() {
        loadingView.hideLoader()
    }
}
