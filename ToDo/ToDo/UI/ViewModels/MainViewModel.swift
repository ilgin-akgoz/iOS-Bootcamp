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
        copyDatabase()
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
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "ToDo", ofType: ".sqlite")
        let folderPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: folderPath).appendingPathComponent("ToDo.sqlite")
        
        let fm = FileManager.default
        if fm.fileExists(atPath: databaseURL.path()) {
           print("db already exists")
        } else {
            do {
                try fm.copyItem(atPath: bundlePath!, toPath: databaseURL.path)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
