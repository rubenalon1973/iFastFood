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
    @StateObject var orderVm = OrderViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(vm)
                .environmentObject(orderVm)
        }
    }
}
