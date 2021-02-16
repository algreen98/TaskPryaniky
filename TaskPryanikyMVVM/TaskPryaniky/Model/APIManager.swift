//
//  APIManager.swift
//  TaskPryaniky
//
//  Created by mac on 11.02.2021.
//

import Foundation

struct APIManager: Decodable {
    
    var data: [DataJSON]
    let view: [String]
}

struct DataJSON: Decodable {
    
    var name: String
    let data: DataClass
}

struct DataClass: Decodable {
    
    let selectedId: Int?
    let variants: [Variants]?
    let text: String?
    let url: String?
}

struct Variants: Decodable {
    
    let id: Int
    let text: String
}
