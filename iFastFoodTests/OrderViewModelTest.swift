//
//  OrderViewModelTest.swift
//  iFastFoodTests
//
//  Created by Ruben Alonso on 30/5/23.
//

import XCTest
@testable import iFastFood

final class OrderViewModelTest: XCTestCase {
    
    var orderViewModel: OrderViewModel!
    

    override func setUpWithError() throws {
        orderViewModel = OrderViewModel()
    }

    override func tearDownWithError() throws {
        orderViewModel = nil
    }

    func testAddDishToArray() {
        let dish: MenuDishes = .previewDish
        
        XCTAssertTrue(orderViewModel.orderedDishes.isEmpty)
        
        orderViewModel.addDishToOrder(dish: dish)
        
        XCTAssertFalse(orderViewModel.orderedDishes.isEmpty)
        XCTAssertTrue(orderViewModel.orderedDishes.count == 1)
        
        for _ in 1...3 {
            orderViewModel.addDishToOrder(dish: dish)
        }
        XCTAssertTrue(orderViewModel.orderedDishes.count == 4)
    }
    
    func testTotalPay_With_Percentage() {
        var result = ""
        
        
        orderViewModel.orderedDishes = [.previewDish, .previewDish, .previewDish]
        
        result = orderViewModel.totalPay(percentage: 10)
        
        XCTAssertTrue(result == "19.80")
        
        result = orderViewModel.totalPay(percentage: 15)

        XCTAssertTrue(result == "20.70")
    }
}
