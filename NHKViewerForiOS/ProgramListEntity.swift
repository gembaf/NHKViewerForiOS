//
//  ProgramListEntity.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/14.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import Mapper
import Foundation

struct ProgramListEntity: Mappable {
    let programs: [ProgramEntity]
    
    init(map: Mapper) throws {
        programs = map.optionalFrom("g1") ?? []
    }
}
