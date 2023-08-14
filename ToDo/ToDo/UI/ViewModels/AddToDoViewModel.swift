//
//  AddToDoViewModel.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 14.08.2023.
//

import Foundation

class AddToDoViewModel {
    var toDoRepo = ToDoDaoRepository()
    
    func addToDo(item: String) {
        toDoRepo.addToDo(item: item)
    }
}
