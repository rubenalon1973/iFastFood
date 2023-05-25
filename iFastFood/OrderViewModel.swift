//
//  OrderViewModel.swift
//  iFastFood
//
//  Created by Ruben Alonso on 24/5/23.
//

import Foundation


enum PaymentTypes: String, CaseIterable {
    case cash = "Cash"
    case creditCard = "Credit Card"
    case fastfoodPoints = "FastFoodPoins"
        }

//cada vista tiene q tener su cerebro
final class OrderViewModel: ObservableObject {
    @Published var orderedDishes: [MenuDishes] = []
    @Published var paymentType: PaymentTypes = .cash
    
    
//    let paymentTypes = ["Cash", "Credit Card", "FastFoodPoints"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    //    añadir un plato al pedido. Toma el plato recibido como argumento y lo agrega al array orderedDishes. Luego, imprime el contenido actualizado de orderedDishes.
    func addDishToOrder(dish: MenuDishes) {
        orderedDishes.append(dish)
    }
    
    func totalPay(percentage: Int) -> String {
        let totalPrice = orderedDishes.reduce(0.0) { $0 + Double($1.price) }
        let tipAmount = totalPrice * Double(percentage) / 100.0
        return String(format: "%.2f", (totalPrice + tipAmount)) //redondeamos a dos decimales
    }
}
