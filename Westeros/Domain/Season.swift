//
//  Season.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 2/28/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation

typealias Episodes = Set<Episode>
final class Season {
    
    private let _episodes: Episodes
    let name: String
    let launchDay: Date
    
    init(name: String, launchDay: Date) {
        self._episodes = Episodes();
        self.name = name
        self.launchDay = launchDay
    }

    
    
    
    
    
}
