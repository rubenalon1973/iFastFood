//
//  iFastFoodApp.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import SwiftUI

@main
struct iFastFoodApp: App {
    @StateObject var vm = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainMenuListView()
                .environmentObject(vm)
        }
    }
}
