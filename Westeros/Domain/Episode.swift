//
//  Episode.swift
//  Westeros
//
//  Created by Mobile Sevenminds on 2/28/18.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import Foundation


final class Episode {
    
    let title : String
    let emissionDate : Date
    weak var season: Season?
    
    init(title: String, emissionDate: Date, season: Season) {
        self.title = title
        self.emissionDate = emissionDate
        self.season = season
    }
    
}

// MARK: - Proxies
extension Episode {
    var proxyForEquality: String {
        return "\(season!.name) \(title)"
    }
    
    var proxyForComparison: String {
        return proxyForEquality.uppercased()
    }
    
    var proxyForDescription: String {
        return "\(title), season: \(season!.name)"
    }
}

// Mark: - Hashable
extension Episode: Hashable {
    var hashValue: Int {
       return proxyForEquality.hashValue
    }
}

// Mark: - equatable
extension Episode: Equatable {
    static func ==(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

// Mark: - Comparable
extension Episode: Comparable {
    static func <(lhs: Episode, rhs: Episode) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

// Mark: - String
extension Episode: CustomStringConvertible {
    var description: String {
        return proxyForDescription
    }
}
