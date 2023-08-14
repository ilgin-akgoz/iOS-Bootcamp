//
//  ToDoDaoRepository.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 14.08.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepository {
    var toDoList = BehaviorSubject<[ToDo]>(value: [ToDo]())
    
    func updateToDo(item: String) {
        print("Updated to do: \(item)")
    }

    func loadToDos() {
        var list = [ToDo]()
        let todo1 = ToDo(id: 1, name: "Fill out the survey")
        let todo2 = ToDo(id: 2, name: "Study")
        let todo3 = ToDo(id: 3, name: "Grocery shopping")
        list.append(todo1)
        list.append(todo2)
        list.append(todo3)
        toDoList.onNext(list)
    }
    
    func search(query: String) {
        print("Search for to do: \(query)")
    }
    
    func delete(toDo_id: Int) {
        print("Delete to do: \(toDo_id)")
    }
    
    func addToDo(item: String) {
        print("Added to do: \(item)")
    }
}
