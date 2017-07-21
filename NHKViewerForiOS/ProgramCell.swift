//
//  ProgramCell.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/07/03.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import UIKit

class ProgramCell: UICollectionViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func prepareForReuse() {
        titleLabel.text = nil
    }
    
    func setData(program: Program) {
        titleLabel.text = program.title
        dateLabel.text = program.formatTime()
    }
}
