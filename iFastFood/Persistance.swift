//
//  Persistance.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import Foundation

final class Persistence {
    static let shared = Persistence()
        
    private init(){}
    
    func fetchData() throws -> [MenuModel] {
         Bundle.main.decode(type: [MenuModel].self, from: "menu.json")
    }
}



