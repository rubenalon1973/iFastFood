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

struct MenuDishes: Codable, Identifiable {
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

extension MenuDishes {
    static let previewDish = MenuDishes(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
}
