//
//  ViewModel.swift
//  TaskPryaniky
//
//  Created by mac on 12.02.2021.
//

import Foundation

class ViewModel: TableViewViewModelType {
    
    private var selectedIndexPath: IndexPath?
    
    var jsonParsing = JSONParsing()
    
    func numberOfRows() -> Int {
        return jsonParsing.resultJSON.view.count
    }
    
    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        return TableViewCellViewModel(index: indexPath.row)
    }
  
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(index: selectedIndexPath.row)
    }
    
    func selectedRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }
    
    
}
