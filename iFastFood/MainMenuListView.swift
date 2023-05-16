//
//  MainMenuListView.swift
//  iFastFood
//
//  Created by Ruben Alonso on 14/5/23.
//

import SwiftUI

struct MainMenuListView: View {
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        List {
            ForEach(vm.menuItems) { section in
                Section(section.name) {
                    ForEach(section.items) { item in
                        MainListCellView(menuDish: item)
                    }
                }
            }
        }
    }
}
struct MainMenuListView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuListView()
    }
}
