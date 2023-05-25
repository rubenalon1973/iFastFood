//
//  Persistance.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import Foundation

// clase para persist de datos, de tipo Singleton
final class Persistence {
    //    solo puede haber una inst de Persistence en toda la app y accedemos a través del shared
    static let shared = Persistence()
    
    //MARK: WAY WITHOUT EXTENSION OF HELPERS
    //    let url = Bundle.main.url(forResource: "menu", withExtension: "json")!
    
    //    para que haya una única instancia en toda la app
    private init(){}
    //    con fechData obtenemos los datos(cargados y decodificados) del menu a través de la ext del bundle y su fx decode
    func fetchData() throws -> [MenuModel] {
        return Bundle.main.decode(type: [MenuModel].self, from: "menu.json")
        
        //MARK: WAY WITHOUT EXTENSION OF HELPERS
        //    let data = try Data(contentsOf: url)
        //    return try JSONDecoder().decode([MenuModel].self, from: data)
    }
}



