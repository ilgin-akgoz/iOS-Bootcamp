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
    let db: FMDatabase?
    
    init() {
        let folderPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: folderPath).appendingPathComponent("ToDo.sqlite")
        db = FMDatabase(path: databaseURL.path)
    }
    
    func updateToDo(item: String, id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE ToDo SET name = ? WHERE id = ?", values: [item, id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }

    func loadToDos() {
        db?.open()
        var list = [ToDo]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM ToDo", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let item = result.string(forColumn: "name")!
                
                let toDo = ToDo(id: id, name: item)
                list.append(toDo)
            }
            
            toDoList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func search(query: String) {
        db?.open()
        var list = [ToDo]()
        
        do {
            let result = try db!.executeQuery("SELECT * FROM ToDo WHERE name like '%\(query)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let item = result.string(forColumn: "name")!
                
                let toDo = ToDo(id: id, name: item)
                list.append(toDo)
            }
            
            toDoList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func delete(toDo_id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM ToDo WHERE id = ?", values: [toDo_id])
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func addToDo(item: String) {
        db?.open()
        
        do {
            try db!.executeUpdate("INSERT INTO ToDo (name) VALUES (?)", values: [item])
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
