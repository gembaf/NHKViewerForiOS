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
    
    @IBOutlet weak var dateListPickerView: UIPickerView!
    
    fileprivate var dateList = ["2017-07-21", "2017-07-22", "2017-07-23", "2017-07-24", "2017-07-25", "2017-07-26", "2017-07-27"]
    fileprivate var selectedDate = ""
                    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        dateListPickerView.dataSource = self
        dateListPickerView.delegate = self
    }
    
    @IBAction func onFetch(_ sender: Any) {
        fetchProgramEntities(strDate: selectedDate)
        
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

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dateList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dateList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedDate = dateList[row]
    }
}
