//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Kasım on 9.08.2023.
//

import Foundation
import RxSwift


class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    let db : FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        //print("Kişi Kaydet : \(kisi_ad) - \(kisi_tel)")
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO kisiler (kisi_ad,kisi_tel) VALUES (?,?)", values: [kisi_ad,kisi_tel])
        }catch{
            print(error.localizedDescription) // hata aciklamasini görebiliriz
        }
        
        db?.close()
    }
    
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        //print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE kisiler SET kisi_ad = ?,kisi_tel = ? WHERE kisi_id = ?", values: [kisi_ad,kisi_tel,kisi_id])
        }catch{
            print(error.localizedDescription) // hata aciklamasini görebiliriz
        }
        
        db?.close()
    }
    
    func sil(kisi_id:Int){
        //print("Kişi Sil : \(kisi_id)")
        
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM kisiler WHERE kisi_id = ?", values: [kisi_id]) // burada silme işlemi id tabanlı oluyor.
            kisileriYukle() // sildikten sonra arayüze verileri yükle
            
        }catch{
            print(error.localizedDescription) // hata aciklamasini görebiliriz
        }
        
        db?.close()
       
    }
    
    func ara(aramaKelimesi:String){
        //print("Kişi Ara : \(aramaKelimesi)")
        
        db?.open()
        var liste = [Kisiler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler WHERE kisi_ad like '%\(aramaKelimesi)%' ", values: nil)
            while result.next(){
                let kisi = Kisiler(kisi_id: Int(result.string(forColumn: "kisi_id"))!,
                                   kisi_ad: result.string(forColumn: "kisi_ad")!,
                                   kisi_tel: result.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
               kisilerListesi.onNext(liste)
            
        }catch{
            print(error.localizedDescription) // hata aciklamasini görebiliriz
        }
        
        db?.close()
    }
    
    func kisileriYukle(){
        
        db?.open()
        var liste = [Kisiler]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM kisiler", values: nil)
            while result.next(){
                let kisi = Kisiler(kisi_id: Int(result.string(forColumn: "kisi_id"))!,
                                   kisi_ad: result.string(forColumn: "kisi_ad")!,
                                   kisi_tel: result.string(forColumn: "kisi_tel")!)
                
                liste.append(kisi)
            }
               kisilerListesi.onNext(liste)
            
        }catch{
            print(error.localizedDescription) // hata aciklamasini görebiliriz
        }
        
        db?.close()
    }
}
