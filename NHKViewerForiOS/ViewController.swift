//
//  ViewController.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/05.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // var endpoint = "http://api.nhk.or.jp/v2/pg/list/{area}/{service}/{date}.json?key={apikey}"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let keyFilePath = Bundle.main.path(forResource: "Keys", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: keyFilePath)!
        let apiKey = dict["API_KEY"] as? String
        
        let endpoint = "http://api.nhk.or.jp/v2/pg/list/130/g1/2017-06-05.json?key=" + apiKey!
        guard let url = URL(string: endpoint) else { return }
        
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) { data, response, error in
            let result = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
            print(result)
        }
        task.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

