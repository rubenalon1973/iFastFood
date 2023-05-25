//
//  Extensions.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import Foundation

// con esto le ampliamos la funcionalidad a bundle, dandole la func decode
extension Bundle {
    //    la func decode de type <T> cogerá cualquier archivo del bundle y decodificará, type:tipo de dato a decodf., file:name del archivo cargar y decodf.
    func decode<T: Codable>(type: T.Type, from file: String) -> T { //cdo ponemos palabra delante etiqueta sale esa palabra
        //        nos aseguramos de obtener la url
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to get to url: \(file) from Bundle")
        }
        //        nos aseguramos de cargar los datos
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from Bundel")
        }
        //        para decodificar los datos en formato JSON
        let decoder = JSONDecoder()
        //        nos aseguramos de decodificar los datos
        guard let myData = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed decoding data")
        }
        //        dev ls archivos decodif de type T
        return myData
    }
}


