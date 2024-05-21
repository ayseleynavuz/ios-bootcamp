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
             
             self.view.showToast(message: "new todo added.")
                   
                   // Toast mesajı gösterildikten sonra işlem tamamlandıktan bir süre sonra geri dönecek
                   DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                       self.navigationController?.popViewController(animated: true)
                   }
            
             
         }
     }
    

}
