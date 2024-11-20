//
//  ApiNetworkTests.swift
//  HeroWikiTests
//
//  Created by AudyDev on 20/11/24.
//

import XCTest
@testable import HeroWiki

class ApiNetworkTests: XCTestCase {
    var apiNetwork: ApiNetwork!
    var query: String!
    var idModel: String!
    
    override func setUpWithError() throws {
        apiNetwork = ApiNetwork()
        query = "SuperMan"
        idModel = "1"
    }

    override func tearDownWithError() throws {
        apiNetwork = nil
        query = nil
        idModel = nil
    }

    func test_getHeroesByQuery_ShouldResponseSuccessly() async throws {
        let wrapper: Wrapper? = try await apiNetwork.getHeroesByQuery(query: query)
        XCTAssert(wrapper?.response == "success")
    }

    func test_getHeroesById_ShouldReturnACorrectSuperHeroModel() async throws {
        let superheroes = try await apiNetwork.getHeroesById(id: idModel)
        XCTAssert(superheroes.id == idModel)
    }
}
