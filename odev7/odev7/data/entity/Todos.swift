//
//  Todos.swift
//  odev7
//
//  Created by Aleyna on 20.05.2024.
//

import Foundation



class Todos {
    var todo_id : Int?
    var todo_name : String?
    
    
    init(){
        
    }
    
    
    init(todo_id: Int, todo_name: String) {
        self.todo_id = todo_id
        self.todo_name = todo_name
    }
}
