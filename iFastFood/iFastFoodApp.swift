//
//  iFastFoodApp.swift
//  iFastFood
//
//  Created by Ruben Alonso on 10/5/23.
//

import SwiftUI

//punto de entrada de la app
@main
//definimos la estruc. de la app, con protocolo App
struct iFastFoodApp: App {
    //    creamos vm aquí para almacenar y gestionar los dif estados de las view, se inicializa solo una vez(con inst de la class ViewModel) y se mtne durante el ciclo de vida de la vista, cdo obj de la view cambie, aquí se actualizará la view q sea. La ventaja del @stateObj es q mtienes un obj de estado indepx y compartido entre dif views, y no hay q tenerlo en cada view.
    @StateObject var vm = ViewModel()
    @StateObject var orderVm = OrderViewModel()
    //    escena principal de la app
    var body: some Scene {
        //        crea grupo de vtanas para la app
        WindowGroup {
            //            creamos una inst de MainMenuListView q se mostrará en la view principal, con su contenido
            MainTabView()
            //            la inst de vm estará disp en toda la app, y MainMenuListView podrá acceder al ViewModel y se actualice cdo haya cambios en las prop @published
                .environmentObject(vm)
                .environmentObject(orderVm)
            //            .preferredColorScheme( .dark)//siempre en black todas las view
        }
    }
}
