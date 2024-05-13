//
//  ViewController.swift
//  FilmlerUygulamasiMVVM
//
//  Created by Aleyna on 3.05.2024.
//

import UIKit

class Anasayfa: UIViewController {
    
    
    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]()
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        _ = viewModel.filmlerListesi.subscribe(onNext : { liste in
            self.filmlerListesi = liste
            self.filmlerCollectionView.reloadData()
        })
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10) // solda, sağda ve ortasında 10 bosluk verecektir.
        tasarim.minimumInteritemSpacing = 10 // aradaki bosluk
        tasarim.minimumLineSpacing = 10  // dikeydeki boşluk
        
        // 10 X 10 X 10  totalde 30 boşluk var
        
        // EKRAN GENİSLİGİ İÇİN
        let ekranGenislik = UIScreen.main.bounds.width
        let itemGenislik  = (ekranGenislik - 30)/2  // yan yana iki item yerleştirmek istediğimiz için ikiye bölüyoruz.
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik * 1.6) // yukseklik artsın diye bir çarpanla çarpıyoruz yükseklik 1.6 katı olsun diyoruz
        
        filmlerCollectionView.collectionViewLayout = tasarim
        
        // başka bir örnek: 15x10x10x15 , 3 item
        // let itemGenislik  = (ekranGenislik - 50)/3
        
        
    }
}

extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource,HucreProtocol{
    // tableview da row, collectionview da items olarak geçiyor.
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    // tableview  da rowAt burada itemAt olarak geçiyor
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmlerListesi[indexPath.row]  // sırayla filmler gelir, 0 dan başlar, döngü ile çalışır
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        // film nesnenin resmine erişmek için
        hucre.imageViewFilm.image = UIImage(named: film.resim!)
        hucre.labelFiyat.text = "\(film.fiyat!) tl"
        
        
        // itemler için border eklliyoruz
        // layer-> hucrenin arkasına erişmek demektir.
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3    // border genişliği
        hucre.layer.cornerRadius = 10.0  // köşe kıvrımı
        
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        return hucre
    }
    
    // itema tıklanılma
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        
        print("\(film.ad!) seçildi")
        performSegue(withIdentifier: "toDetay", sender: film)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let film = sender as? Filmler{
                let gidilecekVC = segue.destination as! DetaySayfa
                gidilecekVC.film = film
                
            }
        }
    }
    
    func sepeteEkleTikla(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        print("\(film.ad!) sepete eklendi.")
    }
    
}


