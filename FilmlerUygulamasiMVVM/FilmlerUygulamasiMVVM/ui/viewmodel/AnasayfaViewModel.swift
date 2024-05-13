//
//  AnasayfaViewModel.swift
//  FilmlerUygulamasiMVVM
//
//  Created by Aleyna on 13.05.2024.
//

import Foundation
import RxSwift



class AnasayfaViewModel{

    var frepo = FilmlerDaoRepository()
    var filmlerListesi = BehaviorSubject<[Filmler]>(value: [Filmler]())
    
    
    // sayfa ilk açıldığı anda filmleri yuklemek istiyorsak
    init(){
        filmlerListesi = frepo.filmlerListesi
        filmleriYukle()
    }
    
    func filmleriYukle(){
        frepo.filmleriYukle()

        
    }
}
