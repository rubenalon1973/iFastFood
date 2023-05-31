//
//  iFastFoodTests.swift
//  iFastFoodTests
//
//  Created by Ruben Alonso on 10/5/23.
//

import XCTest
@testable import iFastFood

final class ViewModelTests: XCTestCase {
    
    var persistence: Persistence!
    var viewModel: ViewModel!
    let dish: MenuDishes = .previewDish

    override func setUpWithError() throws {
        persistence = .shared
        viewModel = ViewModel()
    }
    
    override func tearDownWithError() throws {
        persistence = nil
        viewModel = nil
    }
    
    func testFetchData() throws {
        let data = try persistence.fetchData()
        XCTAssertTrue(data.count == 4)
        XCTAssertGreaterThan(data.count, 0)
        XCTAssertNoThrow(try persistence.fetchData())
    }
    
    func testShowDish_True_When_SearchIsEmpty()  {
//        let dish: MenuDishes = .previewDish
//        let dish = MenuDishes.previewDish
        viewModel.search = ""
        
        XCTAssertTrue(viewModel.showDish(dish: dish))
    }
    
    func testShowDish_Match()  {
//        let dish: MenuDishes = .previewDish
        viewModel.search = "Full"
        
        XCTAssertFalse(viewModel.showDish(dish: dish))
        
        viewModel.search = "Ma"
        
        XCTAssertTrue(viewModel.showDish(dish: dish))
    }
}


