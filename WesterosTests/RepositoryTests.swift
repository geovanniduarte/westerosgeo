//
//  RepositoryTests.swift
//  WesterosTests
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros

class RepositoryTests: XCTestCase {
    
    var localHouses: [House]!
    
    override func setUp() {
        super.setUp()
        localHouses = Repository.local.houses
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalRepositoryCreation() {
        let local = Repository.local
        XCTAssertNotNil(local)
    }
    
    func testLocalRepositoryHousesCreation() {
        XCTAssertNotNil(localHouses)
        XCTAssertEqual(localHouses.count, 3)
    }
    
    func testLocalRepositoryReturnsSortedArrayOfHouses() {
        // [2, 5, 6, 10, 18].sorted()
        // [2, 5, 6, 10, 18]
        XCTAssertEqual(localHouses, localHouses.sorted())
    }
    
    func testLocalRepositoryReturnsHouseByCaseInsensitively() {
        let stark = Repository.local.house(named: "Stark")
        XCTAssertEqual(stark?.name, "Stark")
        
        let keepcoding = Repository.local.house(named: "Keepcoding")
        XCTAssertNil(keepcoding)
    }
    
    func testHouseFiltering() {
        let filtered = Repository.local.houses(filteredBy: { $0.count == 1 })
        XCTAssertEqual(filtered.count, 1)
        
        let otherFilter = Repository.local.houses(filteredBy: { $0.words.contains("invierno")})
        XCTAssertEqual(otherFilter.count, 1)
    }

    func testSeasonFiltering() {
        let filtered = Repository.local.seasons(filteredBy: {$0.name.contains("Season")})
        XCTAssertEqual(filtered.count, 7)
    }
    
}



















