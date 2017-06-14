//
//  ProgramEntity.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/06.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import Mapper
import Foundation

private func extractDate(object: Any?) throws -> Date {
    guard let strDate = object as? String else {
      throw MapperError.convertibleError(value: object, type: String.self)
    }
    
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    return formatter.date(from: strDate)!
}

struct ProgramEntity: Mappable {
    let id: String
    let title: String
    let subtitle: String
    let content: String
    let act: String
    let start_time: Date
    let end_time: Date
    
    init(map: Mapper) throws {
        try self.id = map.from("id")
        try self.title = map.from("title")
        try self.subtitle = map.from("subtitle")
        try self.content = map.from("content")
        try self.act = map.from("act")
        try self.start_time = map.from("start_time", transformation: extractDate)
        try self.end_time = map.from("end_time", transformation: extractDate)
    }
}
