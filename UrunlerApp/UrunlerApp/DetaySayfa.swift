//
//  DetaySayfa.swift
//  UrunlerApp
//
//  Created by Aleyna on 26.04.2024.
//

import UIKit

class DetaySayfa: UIViewController {
    
    @IBOutlet weak var labelUrunFiyat: UILabel!
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    var urun : Urunler?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let u = urun{
            self.navigationItem.title = u.ad
            imageViewUrun.image = UIImage(named: u.resim!)
            labelUrunFiyat.text = "\(u.fiyat!) tl"
        }

    }
    
    
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let u = urun{
            print("Detay sayfa : \(u.ad!) sepete eklendi.")
        }
    }
    
    

}
