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

final class OrderViewModel: ObservableObject {
    @Published var orderedDishes: [MenuDishes] = []
    @Published var paymentType: PaymentTypes = .cash
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    func addDishToOrder(dish: MenuDishes) {
        orderedDishes.append(dish)
    }
    
    func totalPay(percentage: Int) -> String {
        let totalPrice = orderedDishes.reduce(0.0) { $0 + Double($1.price) }
        let tipAmount = totalPrice * Double(percentage) / 100.0
        return String(format: "%.2f", (totalPrice + tipAmount)) //redondeamos a dos decimales
    }
}
