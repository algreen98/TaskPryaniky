//
//  JSONParsing.swift
//  TaskPryaniky
//
//  Created by mac on 11.02.2021.
//

import Foundation

struct JSONParsing {
    
    var resultJSON: APIManager!
    
    init() {
        loadData()
    }
    
    mutating func loadData () {
        let urlString = "https://pryaniky.com/static/json/sample.json"
        let url = URL(string: urlString)
        guard url != nil else { return }
        
        do {
            let data = try Data(contentsOf: url!)
            let decoder = JSONDecoder()
            let result = try decoder.decode(APIManager.self, from: data)
            resultJSON = result
        } catch {
            print (error)
        }
    }
}
