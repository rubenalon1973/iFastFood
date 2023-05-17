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
        NavigationView {
            List {
                ForEach(vm.menuItems) { section in
                    Section(section.name) {
                        ForEach(section.items.filter { $0.name.localizedCaseInsensitiveContains(vm.search) || vm.search.isEmpty }) { item in
                            NavigationLink(destination: ListViewDetalil(dish: item)) {
                                MainListCellView(menuDish: item)
                            }
                        }
                    }
                }
                .searchable(text: $vm.search)
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
}
