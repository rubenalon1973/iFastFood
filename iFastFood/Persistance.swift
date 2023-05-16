//
//  Persistance.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import Foundation


final class Persistence {
    static let shared = Persistence()
//        MARK: WAY WITHOUT EXTENSION
//    let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
    
    private init(){} //para que haya una única instancia
    
    func fetchData() throws -> [MenuModel] {
//        MARK: WAY WITHOUT EXTENSION
//        let data = try Data(contentsOf: url)
//        return try JSONDecoder().decode([MenuModel].self, from: data)
        return Bundle.main.decode(type: [MenuModel].self, from: "menu.json")
    }
}


