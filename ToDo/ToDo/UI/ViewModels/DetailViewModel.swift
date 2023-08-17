//
//  DetailViewModel.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 14.08.2023.
//

import Foundation

class DetailViewModel {
    var toDoRepo = ToDoDaoRepository()
    
    func updateToDo(item: String, id: Int) {
        toDoRepo.updateToDo(item: item, id: id)
    }
}
