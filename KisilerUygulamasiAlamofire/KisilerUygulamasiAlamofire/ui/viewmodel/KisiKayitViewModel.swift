//
//  KisiKayitViewModel.swift
//  KisilerUygulamasi
//
//  Created by Aleyna on 3.07.2024.
//

import Foundation

class KisiKayitViewModel {
    var krepo = KisilerDaoRepository()
    
    func kaydet(kisi_ad:String,kisi_tel:String){
        krepo.kaydet(kisi_ad: kisi_ad, kisi_tel: kisi_tel)
    }
}
