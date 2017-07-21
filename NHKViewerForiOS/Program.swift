//
//  Program.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/30.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import Foundation
import RealmSwift

public class Program: Object {
    dynamic public var id: String = ""
    dynamic public var title: String = ""
    dynamic public var subtitle: String = ""
    dynamic public var content: String = ""
    dynamic public var act: String = ""
    dynamic public var start_time: Date!
    dynamic public var end_time: Date!
    
    override public static func primaryKey() -> String {
        return "id"
    }
    
    public func formatTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        return formatter.string(from: start_time) + "〜" + formatter.string(from: end_time)
    }
}
