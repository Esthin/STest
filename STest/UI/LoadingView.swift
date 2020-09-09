//
//  LoadingView.swift
//  STest
//
//  Created by Dmitry Kosyakov on 09.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

protocol Loading where Self: UIView {
    func showLoader()
    func hideLoader()
    var isLoading: Bool { get }
}

final class LoadingView: UIView {
    
    var isLoading: Bool = false {
        didSet {
            self.isLoading ? showLoader() : hideLoader()
        }
    }
    
    private let activityIndicator : UIActivityIndicatorView = {
        let actInd = UIActivityIndicatorView(style: .large)
        actInd.translatesAutoresizingMaskIntoConstraints = false
        actInd.color = .white
        actInd.isHidden = false
        actInd.startAnimating()
        return actInd
    }()
    
    private let contenctView : UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        translatesAutoresizingMaskIntoConstraints = false
        isHidden = true
        addSubview(contenctView)
        contenctView.addSubview(activityIndicator)
        contenctView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contenctView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contenctView.heightAnchor.constraint(equalToConstant: 64).isActive = true
        contenctView.widthAnchor.constraint(equalToConstant: 64).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func showLoader() {
        superview?.bringSubviewToFront(self)
        isUserInteractionEnabled = false
        isHidden = false
    }
    
    func hideLoader() {
        isUserInteractionEnabled = true
        isHidden = true
    }
}

extension LoadingView: Loading {
    
}
