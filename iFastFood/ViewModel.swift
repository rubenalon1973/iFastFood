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

//el init arranca al crear una instancia de la clase y ejecuta la fx fechData
    init() {
        //    vamos a la fx fetchData a través de persistence para acceder a los datos, si hay algún fallo -> []
        do {
            menuItems = try persistence.fetchData()
        } catch {
            print("Failed to load data")
            menuItems = []
        }
    }
//    si la búsqueda está vacía = true, y si contiene algo se la compara con el name del plato = true, sino = false //MARK: NO ENTIENDO MUY BIEN, CREO, SOBRE CONTAINS
    func showDish(dish: MenuDishes) -> Bool {
        search.isEmpty || dish.name.lowercased().contains(search.lowercased())
    }
}

//el ViewModel se encarga de cargar los datos del menú, tiene una propiedad para realizar búsquedas y filtrar los platos del menú, y notifica a las vistas cuando los datos cambian para que se actualicen automáticamente.

