//
//  MenuModel.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import Foundation

//
//  MenuModel.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import Foundation

struct MenuModel: Codable, Identifiable {
    let id: UUID
    let name: String
    let items: [MenuDishes]
}

struct MenuDishes: Codable, Identifiable, Hashable {
    
    let id: UUID
    let name: String
    let photoCredit: String
    let price: Int
    let restrictions: [String]
    let description: String
    
    var mainImage: String {
        name.replacingOccurrences(of: " ", with: "-").lowercased()
    }
    var thumbnailImage: String {
        mainImage.appending("-thumb")
    }
}

extension MenuDishes {
    static let previewDish = MenuDishes(id: UUID(), name: "Maple French Toast", photoCredit: "Joseph Gonzalez", price: 6, restrictions: ["G", "V"], description: "Sweet, fluffy, and served piping hot, our French toast is flown in fresh every day from Maple City, Canada, which is where all maple syrup in the world comes from. And if you believe that, we have some land to sell you…")
}
