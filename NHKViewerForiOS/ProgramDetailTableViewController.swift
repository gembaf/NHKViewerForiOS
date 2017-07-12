//
//  ProgramDetailTableViewController.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/07/12.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import UIKit

class ProgramDetailTableViewController: UITableViewController {
    public var program: Program!
    
    @IBOutlet weak var titleLabel: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = program.title
    }
    
    public func setProgram(program: Program) {
        self.program = program
    }
}

