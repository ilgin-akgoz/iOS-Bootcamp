//
//  MainViewModel.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 14.08.2023.
//

import Foundation
import RxSwift

class MainViewModel {
    var toDoRepo = ToDoDaoRepository()
    var toDoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    init() {
        toDoList = toDoRepo.toDoList
    }
    
    func search(query: String) {
        toDoRepo.search(query: query)
    }
    
    func loadToDos() {
        toDoRepo.loadToDos()
    }
    
    func delete(toDo_id: Int) {
        toDoRepo.delete(toDo_id: toDo_id)
        loadToDos()
    }
}
