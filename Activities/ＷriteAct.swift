//
//  ＷriteAct.swift
//  Activities
//
//  Created by User02 on 2019/1/15.
//  Copyright © 2019 Chiafishh. All rights reserved.
//

import Foundation
struct WriteAct: Codable {
    var title: String
    var article: String
    static func read() -> [WriteAct]? {
        if let data = UserDefaults.standard.data(forKey: "writeacts"), let writeacts = try? PropertyListDecoder().decode([WriteAct].self, from: data) {
            return writeacts
        }else {
            return nil
        }
    }
    
    static func save(writeacts: [WriteAct]) {
        let encoder = PropertyListEncoder()
        if let data = try? encoder.encode(writeacts) {
            UserDefaults.standard.set(data, forKey: "writeacts")
            
        }
    }
}
