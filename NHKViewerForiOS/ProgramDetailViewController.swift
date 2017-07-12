//
//  ProgramDetailViewController.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/07/12.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import UIKit

class ProgramDetailViewController: UIViewController {
    public var program: Program!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ProgramDetailTableViewController
        vc.setProgram(program: program)
    }
    
    public func setProgram(program: Program) {
        self.program = program
    }
    
    @IBAction func clickBackButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

