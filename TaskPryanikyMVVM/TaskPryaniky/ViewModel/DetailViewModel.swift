//
//  DetailViewModel.swift
//  TaskPryaniky
//
//  Created by mac on 12.02.2021.
//

import Foundation
import UIKit

class DetailViewModel: DetailViewModelType {

    var jsonParsing = JSONParsing()
    
    var description: String = ""
    var text: String?
    var url: String?
    
    var selectedId: Int?
    
    var idVariantsOptional: Int?
    var arrayOfIdVariants: [Int?] = [0]
    
    var textVariantsOptional: String?
    var arrayOfTextVariants: [String?] = [""]
    
    
    func addDescriptionTextFromVC(selectedIndex: Int) -> [String?] {
        for index in 0...jsonParsing.resultJSON.data.count - 1 {
            if jsonParsing.resultJSON.view[selectedIndex] == jsonParsing.resultJSON.data[index].name {
                self.description = jsonParsing.resultJSON.data[index].name
                self.text = jsonParsing.resultJSON.data[index].data.text
                self.url = jsonParsing.resultJSON.data[index].data.url
            }
        }
        return [description, text, url]
    }
    
    func addSelectedIndex(selectedIndex: Int) -> Int? {
        for index in 0...jsonParsing.resultJSON.data.count - 1 {
            if jsonParsing.resultJSON.view[selectedIndex] == jsonParsing.resultJSON.data[index].name {
                self.selectedId = jsonParsing.resultJSON.data[index].data.selectedId
            }
        }
        return self.selectedId
    }
    
    func variantsId(selectedIndex: Int) -> [Int?] {
        var currentIndex = 0
        for index in 0...jsonParsing.resultJSON.data.count - 1 {
            if jsonParsing.resultJSON.view[selectedIndex] == jsonParsing.resultJSON.data[index].name {
                self.selectedId = jsonParsing.resultJSON.data[index].data.selectedId
                if self.selectedId != nil {
                    currentIndex = index
                }
            }
        }
        if currentIndex != 0 {
            for index in 0..<jsonParsing.resultJSON.data[currentIndex].data.variants!.count {
                self.idVariantsOptional = jsonParsing.resultJSON.data[currentIndex].data.variants![index].id
                self.arrayOfIdVariants.append(idVariantsOptional!)
            }
            self.arrayOfIdVariants.remove(at: 0)
        }
        return arrayOfIdVariants
    }
    
    
    func variantsText(selectedIndex: Int) -> [String?] {
        var currentIndex = 0
        for index in 0...jsonParsing.resultJSON.data.count - 1 {
            if jsonParsing.resultJSON.view[selectedIndex] == jsonParsing.resultJSON.data[index].name {
                self.selectedId = jsonParsing.resultJSON.data[index].data.selectedId
                if self.selectedId != nil {
                    currentIndex = index
                }
            }
        }
        if currentIndex != 0 {
            for index in 0..<jsonParsing.resultJSON.data[currentIndex].data.variants!.count {
                self.textVariantsOptional = jsonParsing.resultJSON.data[currentIndex].data.variants![index].text
                self.arrayOfTextVariants.append(textVariantsOptional!)
            }
            self.arrayOfTextVariants.remove(at: 0)
        }
        return arrayOfTextVariants
    }
    
    init(index: Int) {
        self.description = addDescriptionTextFromVC(selectedIndex: index)[0] ?? ""
        self.text = addDescriptionTextFromVC(selectedIndex: index)[1]
        self.url = addDescriptionTextFromVC(selectedIndex: index)[2]
        self.selectedId = addSelectedIndex(selectedIndex: index)
        self.arrayOfIdVariants = variantsId(selectedIndex: index)
        self.arrayOfTextVariants = variantsText(selectedIndex: index)
    }
}

//        if selectedIndex == 2 {
//            for index in 0...jsonParsing.resultJSON.data[selectedIndex].data.variants!.count - 1 {
//                self.idVariantsOptional = jsonParsing.resultJSON.data[selectedIndex].data.variants![index].id
//            }
//        }
//        return idVariantsOptional
