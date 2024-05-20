//
//  ViewController.swift
//  odev7
//
//  Created by Aleyna on 18.05.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var todosTableView: UITableView!
    
    var todosList = [Todos]()
    
    var viewModel = AnasayfaViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        todosTableView.delegate = self
        todosTableView.dataSource = self
        
    
        _ = viewModel.todoList.subscribe(onNext: { liste in
            self.todosList = liste
            self.todosTableView.reloadData()
        })
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadTodos()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            if let todo = sender as? Todos {
                let gidilecekVC = segue.destination as! TodoDetay
                gidilecekVC.todo = todo
            }
        }
    }
    
}


extension Anasayfa : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(aramaKelimesi: searchText)
    }
}


extension Anasayfa : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = todosList[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "todosHucre") as! TodoHucre
        
        hucre.labelTodoName.text = todo.todo_name
        
        return hucre
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo = todosList[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: todo)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in
            let todo = self.todosList[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(todo.todo_name!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.viewModel.delete(todo_id: todo.todo_id!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
