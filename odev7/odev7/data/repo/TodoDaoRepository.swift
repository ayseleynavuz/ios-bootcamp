//
//  TodoDaoRepository.swift
//  odev7
//
//  Created by Aleyna on 20.05.2024.
//

import Foundation
import RxSwift


class TodoDaoRepository{

var todosList = BehaviorSubject<[Todos]>(value: [Todos]())

let db : FMDatabase?

init(){
    let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo.sqlite")
    
    db = FMDatabase(path: veritabaniURL.path)
}




func save(todo_name : String){
    
    db?.open()
    
    do{
        try db!.executeUpdate("INSERT INTO toDos (todo_name) VALUES (?)", values: [todo_name])
    }catch{
        print(error.localizedDescription) // hata aciklamasini görebiliriz
    }
    
    db?.close()
}



func update(todo_id:Int,todo_name:String){
    db?.open()
    
    do{
        try db!.executeUpdate("UPDATE toDos SET todo_name = ? WHERE todo_id = ?", values: [todo_name, todo_id])
    }catch{
        print(error.localizedDescription) // hata aciklamasini görebiliriz
    }
    
    db?.close()
}



func delete(todo_id:Int){
    
    db?.open()
    
    do{
        try db!.executeUpdate("DELETE FROM toDos WHERE todo_id = ?", values: [todo_id]) // burada silme işlemi id tabanlı oluyor.
        uploadTodos() // sildikten sonra arayüze verileri yükle
        
    }catch{
        print(error.localizedDescription) // hata aciklamasini görebiliriz
    }
    
    db?.close()
   
}




   func search(aramaKelimesi:String){
       
       db?.open()
       var liste = [Todos]()
       
       do{
           let result = try db!.executeQuery("SELECT * FROM toDos WHERE todo_name like '%\(aramaKelimesi)%' ", values: nil)
           while result.next(){
               let todo = Todos(todo_id: Int(result.string(forColumn: "todo_id"))!,
                                  todo_name: result.string(forColumn: "todo_name")!)
               
               liste.append(todo)
           }
            todosList.onNext(liste)
           
       }catch{
           print(error.localizedDescription) // hata aciklamasini görebiliriz
       }
       
       db?.close()
   }
                                
                                
 func uploadTodos(){
                   db?.open()
                   var liste = [Todos]()
                                     
                    do{
                        let result = try db!.executeQuery("SELECT * FROM toDos", values: nil)
                            while result.next(){
                                let todo = Todos(todo_id: Int(result.string(forColumn: "todo_id"))!,
                                                 todo_name: result.string(forColumn: "todo_name")!)
                                             liste.append(todo)
                                         }
                                            todosList.onNext(liste)
                                         
                                     }catch{
                                         print(error.localizedDescription) // hata aciklamasini görebiliriz
                                     }
                                     
                                     db?.close()
                                }
                             
                                

                                
}

                                
                                
                                
                                



