//
//  KategorilerDaoRepository..swift
//  odev6
//
//  Created by Aleyna on 9.05.2024.
//

import Foundation

import RxSwift


class KategorilerDaoRepository {
    var kategorilerListesi = BehaviorSubject<[Kategoriler]>(value: [Kategoriler]())
    
    func kategorileriYukle(){
        
        var liste = [Kategoriler]()
        
        let s1 = Kategoriler(id: 1, ad: "Süper İkili", resim:"superikili")
        let s2 = Kategoriler(id: 2, ad: "Kazandıranlar", resim:"kazandıranlar")
         let s3 = Kategoriler(id: 3, ad: "Çiçekçi", resim:"cicekci")
         let s4 = Kategoriler(id: 4, ad: "İndirimler", resim:"indirimler")
         let s5 = Kategoriler(id: 5, ad: "Mor İndirim", resim:"morindirim")
         
         let s6 = Kategoriler(id: 6, ad: " Su & İçecek", resim:"suicecek")
         let s7 = Kategoriler(id: 7, ad: " Meyve & Sebze", resim: "meyvesebze")
         let s8 = Kategoriler(id: 8, ad: "Süt Ürünleri", resim: "suturun")
         let s9 = Kategoriler(id: 9, ad: "Fırından", resim: "fırından")
         let s10 = Kategoriler(id: 10, ad: "Atıştırmalık", resim: "atistirmalik")
         let s11 = Kategoriler(id: 11, ad: "Dondurma", resim: "dondurma")
         let s12 = Kategoriler(id: 12, ad: "Temel Gıda", resim: "temelgida")
         let s13 = Kategoriler(id: 13, ad: "Kahvaltılık", resim: "kahvaltilik")
         let s14 = Kategoriler(id: 14, ad: "Yiyecek", resim: "yiyecek")
         let s15 = Kategoriler(id: 15, ad: "Fit & Form", resim: "fitform")
         let s16 = Kategoriler(id: 16, ad: "Kişisel Bakım", resim: "kisiselbakim")
         let s17 = Kategoriler(id: 17, ad: "Ev Bakım", resim: "evbakim")
         let s18 = Kategoriler(id: 18, ad: "Ev Yaşam", resim: "evyasam")
         let s19 = Kategoriler(id: 19, ad: "Evcil Hayvan", resim: "evcilhayvan")
         let s20 = Kategoriler(id: 20, ad: "Bebek", resim: "bebek")
         
         liste.append(s1)
         liste.append(s2)
         liste.append(s3)
         liste.append(s4)
         liste.append(s5)
         liste.append(s6)
         liste.append(s7)
         liste.append(s8)
         liste.append(s9)
         liste.append(s10)
         liste.append(s11)
         liste.append(s12)
         liste.append(s13)
         liste.append(s14)
         liste.append(s15)
         liste.append(s16)
         liste.append(s17)
         liste.append(s18)
         liste.append(s19)
         liste.append(s20)
        
        
        kategorilerListesi.onNext(liste)
    }
}
