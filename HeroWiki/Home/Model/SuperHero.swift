//
//  SuperHero.swift
//  HeroWiki
//
//  Created by AudyDev on 31/10/24.
//

import Foundation

struct SuperHero:Codable, Identifiable {
    let id:String
    let name:String
    let powerstats:Powerstats
    let biography:Biography
    let appearance:Appearances
    let work:Work
    let connections:Connections
    let image:Images
}

struct Powerstats:Codable {
    let intelligence:String
    let strength:String
    let speed:String
    let durability:String
    let power:String
    let combat:String
}

struct Biography:Codable{
    let fullName:String
    let alterEgos:String
    let aliases:[String]
    let placeOfBirth:String
    let firstAppearance:String
    let publisher:String
    let alignment:String
    
    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases = "aliases"
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher = "publisher"
        case alignment = "alignment"
    }
}

struct Appearances:Codable {
    let gender:String
    let race:String
    let height:[String]
    let weight:[String]
    let eyeColor:String
    let hairColor:String
    
    enum CodingKeys: String, CodingKey {
        case gender = "gender"
        case race = "race"
        case height = "height"
        case weight = "weight"
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

struct Work:Codable {
    let occupation:String
    let base:String
}

struct Connections:Codable {
    let groupAffiliation:String
    let relatives:String
    
    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives = "relatives"
    }
}

struct Images:Codable {
    let url:String
}
