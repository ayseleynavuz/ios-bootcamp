//
//  TodoDetay.swift
//  odev7
//
//  Created by Aleyna on 20.05.2024.
//

import UIKit

class TodoDetay: UIViewController {
    
    
    
    @IBOutlet weak var tfTodoName: UITextField!
    
    
    var todo : Todos?
    
    var viewModel = TodoDetayViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let t = todo {
            tfTodoName.text = t.todo_name
        }

    }
    
    
    @IBAction func buttonUpdate(_ sender: Any) {
        if let tn = tfTodoName.text, let t = todo{
            viewModel.update(todo_id: t.todo_id!, todo_name: tn)
        }
    }
    
    

                               
}
