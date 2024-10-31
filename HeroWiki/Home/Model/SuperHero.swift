//
//  SuperHero.swift
//  HeroWiki
//
//  Created by AudyDev on 31/10/24.
//

import Foundation

struct SuperHero:Codable, Identifiable{
    let id:String
    let name:String
    let image:Image

    enum CodingKeys: String, CodingKey{
        case id = "id"
        case name = "name"
        case image = "image"
    }
}

struct Image:Codable{
    let url:String
}
