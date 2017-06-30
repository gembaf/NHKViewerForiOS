//
//  ProgramStore.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/30.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import Foundation
import RealmSwift

class ProgramStore {
    var realm: Realm?
    
    init() {
        let config = Realm.Configuration(schemaVersion: 1)
        Realm.Configuration.defaultConfiguration = config
        
        realm = try! Realm()
    }
    
    func all() -> Results<Program> {
        return realm!.objects(Program.self)
    }
    
    func addOrUpdate(program: ProgramEntity) {
        try! realm?.write {
            realm?.add(convertToRealmObjects(entity: program), update: true)
        }
    }
    
    func addOrUpdate(programs: [ProgramEntity]) {
        for program in programs {
            addOrUpdate(program: program)
        }
    }
    
    private func convertToRealmObjects(entity: ProgramEntity) -> Program {
        let program = Program()
        
        program.id = entity.id
        program.title = entity.title
        return program
    }
}
