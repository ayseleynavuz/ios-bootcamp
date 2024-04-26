//
//  ViewController.swift
//  KisilerUygulamasi
//
//  Created by Aleyna on 22.04.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kisilerTableView: UITableView!
    var kisilerListesi = [Kisiler]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        kisilerTableView.delegate = self
        kisilerTableView.dataSource = self
        
        let k1 = Kisiler(kisi_id: 1, kisi_ad: "Ali",kisi_tel: "1111")
        let k2 = Kisiler(kisi_id: 2, kisi_ad: "Veli",kisi_tel: "22222")
        let k3 = Kisiler(kisi_id: 3, kisi_ad: "Zeynep",kisi_tel: "1111")
        kisilerListesi.append(k1)
        kisilerListesi.append(k2)
        kisilerListesi.append(k3)
        
        // self -> anasayfayı dolayısıyla UISearchBarDelegate temsil eder.
        // protokole değer aktarılırken bu şekilde kullanılır
        
        //delegate işlemleri
        //bir protokol işlemi varsa yetkilendirilmeden çalışmaz
        //protokol -> sınıflara özellik için eklediğimiz yapılar
    }
    
    // yaşam döngüsü fonksiyonudur. Sayfaya dönüldüğünü gössterir.
    // sayfa ilk açıldığında da çalışır.
    override func viewWillAppear(_ animated: Bool) {
        print("Anasayfaya dönüldü")
    }

    
    /*
    // storyboard alanında detay butonu silindiği için artık gereksizdir.
    @IBAction func buttonDetay(_ sender: Any) {
        let kisi = Kisiler(kisi_id: 1, kisi_ad: "Ali", kisi_tel: "1111")
        //
        performSegue(withIdentifier: "toDetay", sender: kisi)  // çalışınca toDetay tetiklenir, kisi nesnesi gönderilir.
    }
    
    */
    
    
    // filtreleme yapıyoruz
    
    // nesne sender a gelir, toDetay filtresinden geçince kisi nesnesine dönüşür ve
    // KisiDetay sayfasına erişilir kisi nesnesi ona akatarılır.
    // SAYFA GEÇİŞİ İÇİN
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{ // sayfada birden fazla geçiş olduğu için toDetay olduğunda çalışmasını isteriz
            if let kisi = sender as? Kisiler{
                let gidilecekVC = segue.destination as! KisiDetay
                gidilecekVC.kisi = kisi
            }
            
        }
    }
    
    
}


extension Anasayfa : UISearchBarDelegate {
    //UISearchBarDelegate den geliyor
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Kisi Ara: \(searchText)")
    }
}


extension Anasayfa : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisilerListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {// indexPath sayesinde kisi listesindeki kisiler sırayla gelecektir.
        let kisi = self.kisilerListesi[indexPath.row]
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "kisilerHucre") as! KisilerHucre
        hucre.labelKisiAd.text = kisi.kisi_ad
        hucre.labelKisiTel.text = kisi.kisi_tel
        
        return hucre
    }
    
    // SATIRI SEÇMEK İÇİN
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let kisi = kisilerListesi[indexPath.row]
        print("\(kisi.kisi_ad!) seçildi.")
        //print("\(indexPath.row)")
        
        performSegue(withIdentifier: "toDetay", sender: kisi) // hangi kisi nesnesi seçilirse o gönderiliyor.
        
        // sayfaya geri gelindiğinde aynı satırın seçili kalmaması için
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // kaydırma işlemi için
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){contextualAction,view,bool in
            let kisi = self.kisilerListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(kisi.kisi_ad!) silinsin mi?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                print("Kişi Sil: \(kisi.kisi_id!)")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
    
    
    
    
}





