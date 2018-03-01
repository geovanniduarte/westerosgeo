//
//  Repository.swift
//  Westeros
//
//  Created by Alexandre Freire on 13/02/2018.
//  Copyright © 2018 Alexandre Freire. All rights reserved.
//

import UIKit


final class Repository {
    static let local = LocalFactory()
}

protocol HouseFactory {
    
    typealias Filter = (House) -> Bool
    typealias FilterSeason = (Season) -> Bool
    
    
    var houses: [House] { get }
    func house(named: String) -> House?
    func houses(filteredBy: Filter) -> [House]
}

final class LocalFactory: HouseFactory {
    
    var houses: [House] {
        // Houses creation here
        let starkSigil = Sigil(image: UIImage(named: "codeIsComing.png")!, description: "Lobo Huargo")
        
        let lannisterSigil = Sigil(image: #imageLiteral(resourceName: "lannister.jpg"), description: "León rampante")
        let targaryenSigil = Sigil(image: UIImage(named: "targaryenSmall.jpg")!, description: "Dragón Tricéfalo")

        let starkHouse = House(name: "Stark", sigil: starkSigil, words: "Se acerca el invierno", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Stark")! )
        let lannisterHouse = House(name: "Lannister", sigil: lannisterSigil, words: "Oye mi rugido", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Lannister")!)
        let targaryenHouse = House(name: "Targaryen", sigil: targaryenSigil, words: "Fuego y Sangre", url: URL(string: "https://awoiaf.westeros.org/index.php/House_Targaryen")!)
        
        let robb = Person(name: "Robb", alias: "El Joven Lobo", house: starkHouse)
        let arya = Person(name: "Arya", house: starkHouse)
        
        let tyrion = Person(name: "Tyrion", alias: "El Enano", house: lannisterHouse)
        let cersei = Person(name: "Cersei", house: lannisterHouse)
        let jaime = Person(name: "Jaime", alias: "El Matarreyes", house: lannisterHouse)
        
        let dani = Person(name: "Daenerys", alias: "Madre de Dragones", house: targaryenHouse)
        
        // Add characters to houses
        starkHouse.add(person: arya)
        starkHouse.add(person: robb)
        lannisterHouse.add(person: tyrion)
        lannisterHouse.add(person: cersei)
        lannisterHouse.add(person: jaime)
        targaryenHouse.add(person: dani)
        
        return [starkHouse, lannisterHouse, targaryenHouse].sorted()
    }
    
    var seasons : [Season] {
        let season1 = Season(name: "Season 1", launchDay: Date())
        let season2 = Season(name: "Season 2", launchDay: Date())
        let season3 = Season(name: "Season 3", launchDay: Date())
        let season4 = Season(name: "Season 4", launchDay: Date())
        let season5 = Season(name: "Season 5", launchDay: Date())
        let season6 = Season(name: "Season 6", launchDay: Date())
        let season7 = Season(name: "Season 7", launchDay: Date())
        
        let episode11 = Episode(title: "Episode 1", emissionDate: Date(), season: season1)
        let episode12 = Episode(title: "Episode 2", emissionDate: Date(), season: season1)
        
        let episode21 = Episode(title: "Episode 1", emissionDate: Date(), season: season2)
        let episode22 = Episode(title: "Episode 2", emissionDate: Date(), season: season2)
        
        let episode31 = Episode(title: "Episode 1", emissionDate: Date(), season: season3)
        let episode32 = Episode(title: "Episode 2", emissionDate: Date(), season: season3)
        
        let episode41 = Episode(title: "Episode 1", emissionDate: Date(), season: season4)
        let episode42 = Episode(title: "Episode 2", emissionDate: Date(), season: season4)
        
        let episode51 = Episode(title: "Episode 1", emissionDate: Date(), season: season5)
        let episode52 = Episode(title: "Episode 2", emissionDate: Date(), season: season5)
        
        let episode61 = Episode(title: "Episode 1", emissionDate: Date(), season: season6)
        let episode62 = Episode(title: "Episode 2", emissionDate: Date(), season: season6)
        
        let episode71 = Episode(title: "Episode 1", emissionDate: Date(), season: season7)
        let episode72 = Episode(title: "Episode 2", emissionDate: Date(), season: season7)
        
        season1.add(episode: episode11)
        season1.add(episode: episode12)
        
        season2.add(episode: episode21)
        season2.add(episode: episode22)
        
        season3.add(episode: episode31)
        season3.add(episode: episode32)
        
        season4.add(episode: episode41)
        season4.add(episode: episode42)
        
        season5.add(episode: episode51)
        season5.add(episode: episode52)
        
        season6.add(episode: episode61)
        season6.add(episode: episode62)
        
        season7.add(episode: episode71)
        season7.add(episode: episode72)
        
        return[season1, season2, season3, season4, season5, season6, season7].sorted()
    }
    
    func house(named name: String) -> House? {
        let house = houses.filter{ $0.name.uppercased() == name.uppercased() }.first
        //let house = houses.first{ $0.name.uppercased() == name.uppercased() }
        return house
    }
    
    func houses(filteredBy: Filter) -> [House] {
        return Repository.local.houses.filter(filteredBy)
    }
     
    func filtersentence(season: Season) -> Bool{
        return season.name == ""
    }

    func seasons(filteredBy: FilterSeason) -> [Season] {
        return Repository.local.seasons.filter(filteredBy)
    }
    
    
}








