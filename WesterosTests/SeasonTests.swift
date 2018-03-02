//
//  SeasonTests.swift
//  WesterosTests
//
//  Created by Mobile Sevenminds on 2/28/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros
class SeasonTests: XCTestCase {
    
    
    var season1 : Season!
    var season2 : Season!
    
    
    
    override func setUp() {
        super.setUp()
        season1 = Season(name: "Season 1", launchDay: Date())
        season2 = Season(name: "Season 2", launchDay: Date())
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testSeasonEsquality() {
        // identidad
        XCTAssertEqual(season1, season1)
        
        // igualdad
        let newSeason1 = Season(name: "Season 1", launchDay: Date())
        XCTAssertEqual(newSeason1, season1)
        
        // desigualdad
        XCTAssertNotEqual(season1, season2)
    }
    
    func testSeasonHashtable() {
        XCTAssertNotNil(season2.hashValue)
    }
    
    func testSeasonFormComparison() {
        XCTAssertLessThan(season1, season2)
    }
    
    func testSeasonDescription() {
        //difefencia
        XCTAssertNotEqual(season1.description, season2.description)
        
        // Igualdad
        XCTAssertEqual(season1.description, "name: Season 1, Episodes: 2")
    }
}
