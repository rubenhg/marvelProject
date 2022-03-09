//
//  MarvelList.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import Foundation
import UIKit

struct Image: Codable {
    let path: String?
    let ext: String?
    
    enum CodingKeys: String, CodingKey {
        case path = "path"
        case ext = "extension"
    }
}

struct CharacterDataContainer: Codable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [Character]?
}

struct CharacterDataWrapper: Codable {
    let code: Int?
    let status: String?
    let copyright: String?
    let attributionText: String?
    let attributionHTML: String?
    let data: CharacterDataContainer?
    let etag: String?
}

 struct Character: Codable {
    let id: Int?
    let name: String?
    let description: String?
    let modified: String?
    let thumbnail: Image?
    
    init(id: Int?, name: String?, description: String?, modified: String?, thumbnail: Image?) {
        self.id = id
        self.name = name
        self.description = description
        self.modified = modified
        self.thumbnail = thumbnail
    }
    
    func getCharacterImage() -> String {
        guard let urlPath = thumbnail?.path else { return "" }
        guard let urlExt = thumbnail?.ext else { return "" }
        
        return "\(urlPath)/portrait_xlarge.\(urlExt)"
    }
    
}


