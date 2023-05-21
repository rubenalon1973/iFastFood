//
//  MainTabView.swift
//  iFastFood
//
//  Created by Ruben Alonso on 21/5/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            MainMenuListView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            OrdeListView()
                .tabItem {
                    Label("Ordered ", systemImage: "square.and.pencil")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(ViewModel())

    }
}
