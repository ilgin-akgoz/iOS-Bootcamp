//
//  DetailViewModel.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 14.08.2023.
//

import Foundation

class DetailViewModel {
    var toDoRepo = ToDoDaoRepository()
    
    func updateToDo(item: String) {
        toDoRepo.updateToDo(item: item)
    }
}
