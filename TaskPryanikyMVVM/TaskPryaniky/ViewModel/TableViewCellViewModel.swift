//
//  TableViewCellModel.swift
//  TaskPryaniky
//
//  Created by mac on 12.02.2021.
//

import Foundation

class TableViewCellViewModel: TableViewCellViewModelType {
    
    var jsonParsing = JSONParsing()
    
    var name: String = ""
    
    func addName(index: Int) -> String {
        self.name = jsonParsing.resultJSON.view[index]
        return self.name
    }
    
    init(index: Int) {
        self.name = addName(index: index)
    }
}
