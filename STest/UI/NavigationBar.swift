//
//  NavigationBar.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

class NavigationBar: UINavigationBar {
    
    var rightButtonAction: (() -> Void)?
    var leftButtonAction: (() -> Void)?
    
    private let leftButton: UIButton = {
        let button = BarButton()
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(NavigationBar.didTapLeftButton), for: .touchUpInside)
        return button
    }()
    
    private let rightButton: UIButton = {
        let button = BarButton()
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(NavigationBar.didTapRightButton), for: .touchUpInside)
        return button
    }()
    
    private let image: UIImageView = {
        let imageVeiw = UIImageView()
        imageVeiw.image = UIImage(named: "arrows")
        return imageVeiw
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.window?.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    private func commonInit() {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(leftButton)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(rightButton)
        
        addSubview(stackView)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.widthAnchor.constraint(equalTo: image.heightAnchor).isActive = true
        image.heightAnchor.constraint(equalToConstant: 16).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.backgroundColor = .red
        stackView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor).isActive = true
    }
    
    @objc private func didTapLeftButton() {
        leftButtonAction?()
    }
    
    @objc private func didTapRightButton() {
        rightButtonAction?()
    }
    
    func setRightButtonTitle(_ title: String) {
        rightButton.setTitle(title, for: .normal)
    }
    
    func setLeftButtonTitle(_ title: String) {
        leftButton.setTitle(title, for: .normal)
    }
}
