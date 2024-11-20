//
//  HomeViewModelTests.swift
//  HeroWikiTests
//
//  Created by AudyDev on 20/11/24.
//

import XCTest
@testable import HeroWiki

class HomeVMTests: XCTestCase {
    var homeViewModel: HomeVM!
    var query: String!
    
    override func setUpWithError() throws {
        homeViewModel = HomeVM()
        query = "SuperMan"
    }

    override func tearDownWithError() throws {
        homeViewModel = nil
        query = nil
    }

    func test_HomeViewModel_ShouldResponseSuccessly() throws {
        Task{
            await homeViewModel.getHeroes(query: query)
            XCTAssert(homeViewModel.superheroes?.response == "success")
            XCTAssert(homeViewModel.superheroes?.results.count == 1)
        }
    }
}
