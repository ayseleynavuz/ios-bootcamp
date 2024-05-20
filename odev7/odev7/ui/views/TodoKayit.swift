//
//  TodoKayit.swift
//  odev7
//
//  Created by Aleyna on 20.05.2024.
//

import UIKit

class TodoKayit: UIViewController {
    
    
    @IBOutlet weak var tfTodoName: UITextField!
    
    var viewModel = TodoKayitViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func buttonSave(_ sender: Any) {
         if let t = tfTodoName.text{
             viewModel.save(todo_name: t)
         }
     }
    

}
