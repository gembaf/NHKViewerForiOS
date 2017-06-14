//
//  DateFormatter.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/06.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import Foundation

final class DateUtils {
    class func dateFromString(string: String, format: String) -> NSDate {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.dateFromString(string)!
    }
    
    class func stringFromDate(date: NSDate, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(date)
    }
}
