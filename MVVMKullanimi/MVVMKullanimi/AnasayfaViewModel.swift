//
//  AnasayfaViewModel.swift
//  MVVMKullanimi
//
//  Created by Aleyna on 6.05.2024.
//

import Foundation
import RxSwift
 
 //RXSwift : İki katman arasında tetikleme ve dinleme işlemi yapabilir. Bir yerden tetikleme bir yerden dinleme yapabilir.

class AnasayfaViewModel {
    var sonuc = BehaviorSubject<String>(value: "0")
    var mrepo = MatematikRepository()
    
    init(){
        sonuc = mrepo.sonuc
    }
    
    
    
    func toplamaYap(alinanSayi1 : String, alinanSayi2 : String){
        mrepo.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
    func carpmaYap(alinanSayi1 : String, alinanSayi2 : String){
        mrepo.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
    }
    
}
