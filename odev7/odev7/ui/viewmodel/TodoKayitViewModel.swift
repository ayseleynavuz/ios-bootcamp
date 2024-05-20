//
//  TodoKayitViewModel.swift
//  odev7
//
//  Created by Aleyna on 20.05.2024.
//

import Foundation


class TodoKayitViewModel{
    
    var trepo = TodoDaoRepository()
    
    func save(todo_name:String){
        trepo.save(todo_name: todo_name)
      }
    
    
    
   
}
