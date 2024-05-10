//
//  AnasayfaViewModel.swift
//  odev6
//
//  Created by Aleyna on 9.05.2024.
//

import Foundation
import RxSwift


class AnasayfaViewModel {
    var krepo = KategorilerDaoRepository()
    var kategorilerListesi = BehaviorSubject<[Kategoriler]>(value: [Kategoriler]())
    
    init(){
        kategorilerListesi = krepo.kategorilerListesi
        kategorileriYukle()
    }
    
    func kategorileriYukle(){
        krepo.kategorileriYukle()
    }
}
