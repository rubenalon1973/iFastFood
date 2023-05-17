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

    var filteredDishes: [MenuDishes] {
        if search.isEmpty {
            return menuItems.flatMap { $0.items }
        } else {
            return menuItems.flatMap { $0.items }.filter {
                $0.name.localizedCaseInsensitiveContains(search)
            }
        }
    }
    
    init() {
        do {
            menuItems = try persistence.fetchData()
        } catch {
            print("Failed to load data")
            menuItems = []
        }
    }
}

