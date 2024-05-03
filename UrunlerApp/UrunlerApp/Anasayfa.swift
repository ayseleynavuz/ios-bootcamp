//
//  ViewController.swift
//  UrunlerApp
//
//  Created by Aleyna on 26.04.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    
    @IBOutlet weak var urunlerTableView: UITableView!
    
    
    var urunlerListesi = [Urunler]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        urunlerTableView.delegate = self
        urunlerTableView.dataSource = self
        
        
        let u1 = Urunler(id: 1, ad: "Macbook Pro 14", resim: "bilgisayar", fiyat: 33499)
        let u2 = Urunler(id: 2, ad: "Rayban Club Master", resim: "gozluk", fiyat: 1499)
        let u3 = Urunler(id: 3, ad: "Sony ZX Series", resim: "kulaklik", fiyat: 2499)
        let u4 = Urunler(id: 4, ad: "Gio Armani", resim: "parfum", fiyat: 1299)
        let u5 = Urunler(id: 5, ad: "Casio X Series", resim: "saat", fiyat: 899)
        let u6 = Urunler(id: 6, ad: "Dyson V8", resim: "supurge", fiyat: 8899)
        let u7 = Urunler(id: 7, ad: "IPhone 13 Pro", resim: "telefon", fiyat: 25999)
        
        urunlerListesi.append(u1)
        urunlerListesi.append(u2)
        urunlerListesi.append(u3)
        urunlerListesi.append(u4)
        urunlerListesi.append(u5)
        urunlerListesi.append(u6)
        urunlerListesi.append(u7)
        
        urunlerTableView.separatorColor = UIColor(white: 0.95, alpha: 1) 
        
    }


}


//HucreProtocol ekliyoruz buraya

extension Anasayfa : UITableViewDataSource, UITableViewDelegate,HucreProtocol{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return urunlerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let urun = urunlerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "urunlerHucre") as! UrunlerHucre
        hucre.imageViewUrun.image = UIImage(named: urun.resim!)
        hucre.labelUrunAd.text = urun.ad
        hucre.labelUrunFiyat.text =  "\(urun.fiyat!) tl"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1) 
        // gri renk için beyazın tonlarını kullanabiliriz.
        // alpha -> görünürlük 0 görünmez, 1 görünür
        // 0.95 de açık bir gri tonu elde eder.
        
        hucre.hucreArkaplan.layer.cornerRadius = 10.0 // köşe kıvrımı elde etmek için
        
        // seçim animasyonunu görmemek için
        hucre.selectionStyle = .none
        
        // hucre
        hucre.hucreProtocol = self
        hucre.indexpath = indexPath
        
        return hucre
    }
    
    // swipe action - kaydırma işlemleri
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let urun = urunlerListesi[indexPath.row]
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){
            contextualAction,view,bool in  //  contextualAction:kendisini,view : tasarımı, bool: tıklanma durumunu temsil ediyor
            print("\(urun.ad!) silindi")
        }
        
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){
            contextualAction,view,bool in  //  contextualAction:kendisini,view : tasarımı, bool: tıklanma durumunu temsil ediyor
            print("\(urun.ad!) duzenlendi")
        }
        
        return UISwipeActionsConfiguration(actions: [silAction, duzenleAction])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) secildi")
        
        //seçme işlemi artık burada yapılacaktır.
        performSegue(withIdentifier: "toDetay", sender: urun) // sender ile urun nesnesi geliyor
        //prepare metodu hangi sayfaya geçiş yapılacağını ve nereye veri gönderileceğini belirtmek için kullanılır
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{ // doğru sayfaya veri göndermek için filtreleme yapıyoruz,uygulama çökmesin diye
            if let urun = sender as? Urunler{ //senderdaki urunu Urunlere çeviriyoruz
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.urun = urun
            }
        }
    }
    
    
    // protocolden geliyor
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let urun = urunlerListesi[indexPath.row]
        print("\(urun.ad!) sepete eklendi")
    }
}


