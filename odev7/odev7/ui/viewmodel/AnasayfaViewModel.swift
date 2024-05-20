//
//  AnasayfaViewModel.swift
//  odev7
//
//  Created by Aleyna on 20.05.2024.
//

import Foundation
import RxSwift



class AnasayfaViewModel {
    
    var trepo = TodoDaoRepository()
    var todoList = BehaviorSubject<[Todos]>(value: [Todos]())
    
    
    
    init(){
        veritabaniKopyala()
        todoList = trepo.todosList
        uploadTodos()
    }
    
    
    func delete(todo_id:Int){
        trepo.delete(todo_id: todo_id)
        
    }
    
    func search(aramaKelimesi:String){
        trepo.search(aramaKelimesi: aramaKelimesi)
    }
    
    func uploadTodos(){
        trepo.uploadTodos()
    }
    
    
    
    func veritabaniKopyala(){
    let bundleYolu = Bundle.main.path(forResource: "todo", ofType: ".sqlite")
    let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("todo.sqlite")
    let fileManager = FileManager.default
    if fileManager.fileExists(atPath: kopyalanacakYer.path){
    print("Veritabanı zaten var")
    }else{
    do{
    try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
    }catch{}
    }
    }
    

}
    
    
    



