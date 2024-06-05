//
//  FilmlerDaoRepository.swift
//  FilmlerUygulamasiMVVM
//
//  Created by Aleyna on 13.05.2024.
//

import Foundation
import RxSwift


class FilmlerDaoRepository{
    
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritaabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("filmler_app.sqlite")
        
        db = FMDatabase(path: veritaabaniURL.path)
    }

    func filmleriYukle(){
       
        db?.open()
        
        var liste = [Filmler]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM filmer", values: nil)
            
            while rs.next(){ // bu kodlama bir sonraki satırı getirir
                let film = Filmler(id: Int(rs.string(forColumn: "id"))!,
                                   ad: rs.string(forColumn: "ad")!,
                                   resim: rs.string(forColumn: "resim")!,
                                   fiyat: Int(rs.string(forColumn: "fiyat"))!)
                liste.append(film)
            }
            filmlerListesi.onNext(liste)
        }catch{
            print(error.localizedDescription)
        }
        
        
        db?.close()
    }
}
