//
//  ProgramEntity.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/06.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import Mapper
import Foundation

struct ProgramEntity: Mappable {
    let id: String
    let title: String
    
    init(map: Mapper) throws {
        try self.id = map.from("id")
        try self.title = map.from("title")
    }
}
