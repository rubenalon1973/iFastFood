//
//  MainMenuListView.swift
//  iFastFood
//
//  Created by Ruben Alonso on 14/5/23.
//

import SwiftUI

struct MainMenuListView: View {
    @EnvironmentObject var vm: ViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(vm.menuItems) { section in
                    Section(section.name) {
                        ForEach(section.items) { dish in
                            if vm.showDish(dish: dish) {
                                NavigationLink(value: dish) {
                                    MainListCellView(menuDish: dish)
                                }
                            }
                        }
                    }
                }
            }
            .animation( .spring(), value: vm.search)
            .searchable(text: $vm.search)
            .navigationDestination(for: MenuDishes.self) { dish in
                ListViewDetalil(dish: dish)
            }
            .navigationTitle("Menu")
        }
    }
}
struct MainMenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuListView()
            .environmentObject(ViewModel())
    }
}

