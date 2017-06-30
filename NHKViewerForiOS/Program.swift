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
    
    override public static func primaryKey() -> String {
        return "id"
    }
}
