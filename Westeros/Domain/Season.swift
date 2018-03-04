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
    
    private var _episodes: Episodes
    let name: String
    let launchDay: Date
    
    init(name: String, launchDay: Date) {
        self._episodes = Episodes()
        self.name = name
        self.launchDay = launchDay
    }
}

extension Season {
    var count : Int {
        return _episodes.count
    }
    
    func add(episode: Episode) {
        guard episode.season == self else {
            return
        }
        self._episodes.insert(episode)
    }
    
    var sortedEpisodes: [Episode] {
        return self._episodes.sorted()
    }
}

// Mark: - Proxies
extension Season {
    var proxyForEquality : String {
        return "\(name) \(count)"
    }
    
    var proxyForComparison : String {
        return proxyForEquality.uppercased()
    }
}

// Mark: - Hashable
extension Season: Hashable {
    var hashValue: Int {
        return proxyForEquality.hashValue
    }
}

// Mark: - Equatable
extension Season: Equatable {
    static func ==(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison == rhs.proxyForComparison
    }
}

// Mark: - Comparable
extension Season: Comparable {
    static func <(lhs: Season, rhs: Season) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

// Mark: - String descrpition
extension Season: CustomStringConvertible {
    var description : String {
        return " \(name), Episodes: \(count)"
    }
}
