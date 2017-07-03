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
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        titleLabel.text = program.title
        dateLabel.text = formatter.string(from: program.start_time) + "〜" + formatter.string(from: program.end_time)
    }
}
