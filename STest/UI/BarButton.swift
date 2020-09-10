//
//  BarButton.swift
//  STest
//
//  Created by Dmitry Kosyakov on 11.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

class BarButton: UIButton {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        window?.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}
