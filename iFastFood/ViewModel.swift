//
//  ViewModel.swift
//  iFastFood
//
//  Created by Ruben Alonso on 14/5/23.
//

import Foundation

//este es el cerebro de las view, para separar la lógica de negocio de los datos de la UI de usuario(comunica el cod. con las view)
//para manejar los datos relacionados con MainMenuListView y su funcionalidad
//el protoc ObservableObject nos permite tener prop @published
final class ViewModel: ObservableObject {
//    creamos inst de persistence donde se cargan y decode de los datos
    let persistence = Persistence.shared
//    estas prop emiten señales, son observables, y cdo cambien notificarán a las view
    @Published var menuItems: [MenuModel] = []//accedemos a los element de menumodel
    @Published var search = ""//la barra de búsqueda del usuario en la app
//var calculada para filtrar los platos según el criterio metido en search
    @Published var orderedDishes: [MenuDishes] = []
    var filteredDishes: [MenuDishes] {
        if search.isEmpty {
//            FIXME: Pendiente revisar como fx flatmap
            return menuItems.flatMap { $0.items }//si no se le pide nada dev []
        } else {
            return menuItems.flatMap { $0.items }.filter {
                $0.name.localizedCaseInsensitiveContains(search)
            }
        }
    }
//    vamos a la fx fetchData a través de persistence para acceder a los datos, si hay algún fallo -> []
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
    
    func addDishToOrder(dish: MenuDishes) {
        orderedDishes.append(dish)
        print(orderedDishes)
    }
}







//el ViewModel se encarga de cargar los datos del menú, tiene una propiedad para realizar búsquedas y filtrar los platos del menú, y notifica a las vistas cuando los datos cambian para que se actualicen automáticamente.

