//
//  TodoDetayViewModel.swift
//  odev7
//
//  Created by Aleyna on 20.05.2024.
//

import Foundation


class TodoDetayViewModel{
    
    var trepo = TodoDaoRepository()
     
     func update(todo_id:Int,todo_name:String){
         trepo.update(todo_id: todo_id, todo_name: todo_name)
     }
}
