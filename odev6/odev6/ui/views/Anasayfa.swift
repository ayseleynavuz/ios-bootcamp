//
//  ViewController.swift
//  odev6
//
//  Created by Aleyna on 8.05.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    
    @IBOutlet weak var kategoriCollectionView: UICollectionView!
    @IBOutlet weak var adressView: UIView!
    @IBOutlet weak var varisView: UIView!
    
    var liste = [Kategoriler]()
    
    //var viewModel = AnasayfaViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let barapperance = UINavigationBarAppearance()
    
        //şarj göstergesinin olduğu kısmı siyah temaya çevirmek
        navigationController?.navigationBar.barStyle = .black
        //Farklı görünümlü apple ürünleri için appereance lar
        navigationController?.navigationBar.standardAppearance = barapperance
        navigationController?.navigationBar.compactAppearance = barapperance
        navigationController?.navigationBar.scrollEdgeAppearance = barapperance
        
        
        
        
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
         
         
    
        
        
        kategoriCollectionView.delegate = self
        kategoriCollectionView.dataSource = self
        
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 8, bottom: 5, right: 8)
        tasarim.minimumInteritemSpacing = 7
        tasarim.minimumLineSpacing = 7
        
        let genislik = kategoriCollectionView.frame.size.width
        
        let yatayUzunluk = (genislik - 10) / 5
        
        tasarim.itemSize = CGSize(width: yatayUzunluk+8, height: yatayUzunluk*1.6)
        
        kategoriCollectionView.collectionViewLayout = tasarim
        
    
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
          .lightContent
      }


}




extension Anasayfa : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return liste.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let kategori = liste[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "kategoriHucre", for: indexPath) as! KategorilerHucre
        cell.kategoriImageView.image = UIImage(named: kategori.resim!)
        cell.kategoriIsmiLabel.text = kategori.ad!
        
        return cell
    }
    
}

