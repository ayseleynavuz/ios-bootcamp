//
//  Kategoriler.swift
//  odev6
//
//  Created by Aleyna on 9.05.2024.
//

import Foundation


class Kategoriler{
    
    var id : Int?
    var ad : String?
    var resim : String?
    
    
    init(){
        
    }
    
    init(id: Int, ad: String, resim: String) {
        self.id = id
        self.ad = ad
        self.resim = resim
    }
}
