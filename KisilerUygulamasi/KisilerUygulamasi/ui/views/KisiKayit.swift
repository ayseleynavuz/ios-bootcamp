//
//  KisiKayit.swift
//  KisilerUygulamasi
//
//  Created by Aleyna on 22.04.2024.
//

import UIKit

class KisiKayit: UIViewController {
    
    
    
    @IBOutlet weak var tfKisiAd: UITextField!
    @IBOutlet weak var tfKisiTel: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    
    @IBAction func buttonKaydet(_ sender: Any) {
        if let ka = tfKisiAd.text , let kt = tfKisiTel.text{
            kaydet(kisi_ad: ka, kisi_tel: kt)
        }
    }
    
    
    func kaydet(kisi_ad : String, kisi_tel : String){
        print("Kisi kaydet : \(kisi_ad) - \(kisi_tel)")
    }
    

}
