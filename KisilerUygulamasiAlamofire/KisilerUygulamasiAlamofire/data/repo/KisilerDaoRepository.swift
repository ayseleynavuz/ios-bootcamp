//
//  KisilerDaoRepository.swift
//  KisilerUygulamasi
//
//  Created by Aleyna on 3.07.2024.
//

import Foundation
import RxSwift
import Alamofire


class KisilerDaoRepository {
    var kisilerListesi = BehaviorSubject<[Kisiler]>(value: [Kisiler]())
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        
        let params : Parameters = ["kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        AF.request("http://kasimadalan.pe.hu/kisiler/insert_kisiler.php", method: .post, parameters: params).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func guncelle(kisi_id:Int,kisi_ad:String,kisi_tel:String){
        //print("Kişi Güncelle : \(kisi_id) - \(kisi_ad) - \(kisi_tel)")
        let params : Parameters = ["kisi_id": kisi_id,"kisi_ad": kisi_ad, "kisi_tel": kisi_tel]
        AF.request("http://kasimadalan.pe.hu/kisiler/update_kisiler.php", method: .post, parameters: params).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func sil(kisi_id:Int){
        
        let params : Parameters = ["kisi_id": kisi_id]
        AF.request("http://kasimadalan.pe.hu/kisiler/delete_kisiler.php", method: .post, parameters: params).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDCevap.self, from: data)
                    print("Başarı: \(cevap.success!)")
                    print("Mesaj: \(cevap.message!)")
                    
                    self.kisileriYukle()
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func ara(aramaKelimesi:String){
        print("Kişi Ara : \(aramaKelimesi)")
        
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php", method: .post,parameters: params).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let gelenListe = cevap.kisiler{
                        self.kisilerListesi.onNext(gelenListe) // tetikleme işlemi
                        for k in gelenListe{
                            print("**********")
                            print("Kisi id: \(k.kisi_id!)")
                            print("Kisi ad: \(k.kisi_ad!)")
                            print("Kisi tel: \(k.kisi_tel!)")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func kisileriYukle(){
        AF.request("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php", method: .get).response{response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let gelenListe = cevap.kisiler{
                        self.kisilerListesi.onNext(gelenListe) // tetikleme işlemi
                        for k in gelenListe{
                            print("**********")
                            print("Kisi id: \(k.kisi_id!)")
                            print("Kisi ad: \(k.kisi_ad!)")
                            print("Kisi tel: \(k.kisi_tel!)")
                        }
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
        kisilerListesi.onNext(liste)//Tetikleme
    }
}
