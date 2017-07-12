//
//  ViewController.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/05.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    // var endpoint = "http://api.nhk.or.jp/v2/pg/list/{area}/{service}/{date}.json?key={apikey}"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        fetchProgramEntities(strDate: "2017-07-12")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let storyboard = UIStoryboard(name: "ProgramViewController", bundle: nil)
        let nextView = storyboard.instantiateInitialViewController() as! ProgramViewController
        self.present(nextView, animated: false, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func fetchProgramEntities(strDate: String) {
        APIClient.programEntities(
            strDate: strDate,
            completionHandler: { data, response, error in
                do {
                    let json = try JSONSerialization.jsonObject(with: data!) as! NSDictionary
                    let list = json["list"] as! NSDictionary
                    let programList = ProgramListEntity.from(list)
                    let programs = (programList?.programs)!
                    
                    ProgramStore().addOrUpdate(programs: programs)
                } catch {}
            }
        )
    }
}

