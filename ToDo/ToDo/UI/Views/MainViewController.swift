//
//  MainViewController.swift
//  ToDo
//
//  Created by Ilgın Akgöz on 1.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var toDoList = [ToDo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearchBar()
        setUpTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailViewController" {
            if let toDo = sender as? ToDo {
                let destinationVC = segue.destination as! DetailViewController
                destinationVC.toDo = toDo
            }
        }
    }
    
    private func setUpTableView() {
        toDoTableView.dataSource = self
        toDoTableView.delegate = self
        
        let todo1 = ToDo(id: 1, name: "Fill out the survey")
        let todo2 = ToDo(id: 2, name: "Study")
        let todo3 = ToDo(id: 3, name: "Grocery shopping")
        toDoList.append(todo1)
        toDoList.append(todo2)
        toDoList.append(todo3)
    }
    
    private func setUpSearchBar() {
        searchBar.delegate = self
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Search for to do item: \(searchText)")
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = toDoList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell") as! ToDoCell
        cell.toDoItemLabel.text = todo.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = toDoList[indexPath.row]
        performSegue(withIdentifier: "DetailViewController", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _,_,_ in
            let todo = self.toDoList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete To Do", message: "Are you sure you want to delete \(todo.name!)?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let yesAction = UIAlertAction(title: "Yes", style: .destructive) { action in
                
            }
            alert.addAction(yesAction)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}
