//
//  DetailViewModelType.swift
//  TaskPryaniky
//
//  Created by mac on 12.02.2021.
//

import Foundation

protocol DetailViewModelType {
    
    var description: String { get }
    var text: String? { get }
    var url: String? { get }
    var selectedId: Int? { get }
    
    var idVariantsOptional: Int? { get }
    var arrayOfIdVariants: [Int?] { get }
    
    var textVariantsOptional: String? { get }
    var arrayOfTextVariants: [String?] { get }
    
    func addDescriptionTextFromVC(selectedIndex: Int) -> [String?]
    
    func addSelectedIndex(selectedIndex: Int) -> Int?
}

