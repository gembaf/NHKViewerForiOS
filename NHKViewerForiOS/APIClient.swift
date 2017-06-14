//
//  APIClient.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/14.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import Foundation

final class APIClient {
    static public func programEntities(strDate: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let keyFilePath = Bundle.main.path(forResource: "Keys", ofType: "plist")!
        let dict = NSDictionary(contentsOfFile: keyFilePath)!
        let apiKey = dict["API_KEY"] as? String
        
        let endpoint = "http://api.nhk.or.jp/v2/pg/list/130/g1/\(strDate).json?key=\(apiKey!)"
        guard let url = URL(string: endpoint) else { return }
        
        let request = URLRequest(url: url)
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
}
