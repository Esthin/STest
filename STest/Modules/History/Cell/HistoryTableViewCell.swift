//
//  HistoryTableViewCell.swift
//  STest
//
//  Created by Dmitry Kosyakov on 10.09.2020.
//  Copyright © 2020 dev.bsl. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var sourceText: UILabel!
    @IBOutlet private weak var targetText: UILabel!

    override func prepareForReuse() {
        sourceText.text = nil
        targetText.text = nil
    }
    
    func setData(_ data: HistoryItemModel) {
        sourceText.text = data.source
        targetText.text = data.target
    }
    
}
