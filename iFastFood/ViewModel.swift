//
//  ViewModel.swift
//  iFastFood
//
//  Created by Ruben Alonso on 14/5/23.
//

import Foundation

final class ViewModel: ObservableObject {
    let persistence = Persistence.shared
    @Published var menuItems: [MenuModel] = []
    @Published var search = ""
    
    init() {
        do {
            menuItems = try persistence.fetchData()
        } catch {
            print("Failed to load data")
            menuItems = []
        }
    }
    
    func showDish(dish: MenuDishes) -> Bool {
        search.isEmpty || dish.name.lowercased().contains(search.lowercased())
    }
}


