//
//  TableViewCellViewModelType.swift
//  TaskPryaniky
//
//  Created by mac on 12.02.2021.
//

import Foundation

protocol TableViewCellViewModelType {
    
    var name: String { get }
    
    func addName(index: Int) -> String 
}
