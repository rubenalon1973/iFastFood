//
//  MenuModel.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import Foundation

struct MenuModel: Codable, Identifiable {
    let id: UUID
    let name: String // nombre secciones
    let items: [MenuDishes] // platos de cada sección
}

struct MenuDishes: Codable {
    let id: UUID
    let name: String
    let photoCredit: String
    let price: Int
    let restrictions: [String]
    let description: String
//    para imágenes de los platos
    //    el nombre de las imag es igual pero tenemos q poner - en vez de  " "
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    var thumbnailImage: String {
        mainImage.appending("-thumb")// para añadir al final lo de las otras imágenes
    }
}
