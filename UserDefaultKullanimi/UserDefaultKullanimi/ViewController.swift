//
//  ViewController.swift
//  UserDefaultKullanimi
//
//  Created by Aleyna on 13.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelSayac: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tanımlama
        let ud = UserDefaults.standard
        
        // ksyit
        ud.set("Ali", forKey: "ad")
        ud.set(23, forKey: "yas")
        ud.set(178, forKey: "boy")
        ud.set(true, forKey: "bekarMi")
        
        let liste = ["Ali","Ece"]
        ud.set(liste, forKey: "liste")
        
        let sehirler = ["16": "Bursa", "34": "istanbul"]
        ud.set(sehirler, forKey: "sehirler")
        //silmne
        ud.removeObject(forKey: "ad")
        
        // okuma
        let gelenAd = ud.string(forKey: "ad") ?? "isimYok"
        let gelenYas = ud.integer(forKey: "yas") // 0 otomatik gelir
        let gelenBoy = ud.double(forKey: "boy") // 0.0 otomatik gelir, ?? kullanımı gerekmez.
        let gelenBekar = ud.bool(forKey: "bekar")  // false varsayılan değer
        
        print("gelen ad: \(gelenAd)")
        print("gelen yas: \(gelenYas)")
        print("gelen boy: \(gelenBoy)")
        print("gelen bekar: \(gelenBekar)")
        
        
        let gelenListe = ud.array(forKey: "liste") ?? [String]()
        for a in liste {
            print("gelen liste: \(a)")
        }
        
        let gelenSehirler = ud.dictionary(forKey: "sehirler") ?? [String : String]()
        for(anahtar,deger) in gelenSehirler {
            print("gelen sehir: \(anahtar) -> \(deger)")
        }
        
        
        // Sayac Uygulamasi
        var sayac = ud.integer(forKey: "sayac") // 0
        sayac = sayac+1
        ud.set(sayac, forKey: "sayac")
        labelSayac.text = "Açılış sayısı: \(sayac)"
        
        
    }
}

