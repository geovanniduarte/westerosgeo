//
//  EpisodeTest.swift
//  WesterosTests
//
//  Created by Mobile Sevenminds on 2/28/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import XCTest
@testable import Westeros
class EpisodeTest: XCTestCase {
    
    var season1 : Season!
    var episode1Season1 : Episode!
    var episode2Season1 : Episode!
    var episode3Season1 : Episode!
    
    var season2:  Season!
    var episode1Season2 : Episode!
    var episode2Season2 : Episode!
    
    override func setUp() {
        super.setUp()
        season1 = Season(name: "Season 1", launchDay: Date())
        episode1Season1 = Episode(title: "Episodio 11", emissionDate: Date(), season: season1)
        episode2Season1 = Episode(title: "Episode 21", emissionDate: Date(), season: season1)
        episode3Season1 = Episode(title: "Episode 31", emissionDate: Date(), season: season1)
        
        season2 = Season(name: "Season 2", launchDay: Date())
        
        episode1Season2 = Episode(title: "Episode 12", emissionDate: Date(), season: season2)
        episode2Season2 = Episode(title: "Episode 22", emissionDate: Date(), season: season2)
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testEpisodeEquality() {
         // Identidad
        XCTAssertEqual(episode1Season1, episode1Season1);
        XCTAssertNotEqual(episode1Season1, episode2Season2)
        
        
    }
    
}
