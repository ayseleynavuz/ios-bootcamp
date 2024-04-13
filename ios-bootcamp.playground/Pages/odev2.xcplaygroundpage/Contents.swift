import Foundation

import UIKit

class Odev2{
    
    func soru1(km : Double)-> Double{
        let mile = km * 0.621
        return mile
    }
    
    // dikdortgen alan hesabi
    func soru2(kenar1 : Int, kenar2 : Int){
        let alan = kenar1 * kenar2
        print("alan : \(alan)")
    }
    
    // faktoriyel hesaplama
    func factorial(sayi : Int) -> Int {
        var sonuc = 1
        for i in 1...sayi {
            sonuc *= i //
        }
       return sonuc
    }
    
    // kelimede kaç e harfi var
    
    func kacEHarfi(kelime: String) {
        var eHarfiSayisi = 0
        for harf in kelime {
            if harf == "e" || harf == "E" {
                eHarfiSayisi += 1
            }
        }
        print("Kelime: '\(kelime)' içinde \(eHarfiSayisi) adet 'e' harfi bulunuyor.")
    }
    
    // Parametre olarak girilen kenar sayısına göre her bir iç açıyı hesaplayıp sonucu geri gönderen metod
    func icAciHesapla(kenarSayısı : Int) -> Int{
        let toplam = ( (kenarSayısı - 2) * 180 ) / kenarSayısı
        return toplam
    }
    
    /*
     Parametre olarak girilen gün sayısına göre maaş hesabı yapan ve elde edilen değeri döndüren metod
    yazınız.
    • 1 günde 8 saat çalışılabilir.
    • Çalışma saat ücreti : 40 ₺
    • Mesai saat ücreti : 80 ₺
    • 150 saat üzeri mesai sayılır.
     */
    
    func maasHesapla(gunSayisi: Int, calismaSaati: Int, calismaSaatUcreti: Double, mesaiSaatUcreti: Double, mesaiSiniri: Int) -> Double {
        let toplamCalismaSaati = gunSayisi * calismaSaati
        var maas: Double = 0
        if toplamCalismaSaati <= mesaiSiniri * gunSayisi {
               // Eğer toplam çalışma saati mesai sınırının altındaysa
               maas = Double(gunSayisi * calismaSaati) * calismaSaatUcreti
           } else {
               // Eğer toplam çalışma saati mesai sınırının üstündeyse
               let mesaiSaatleri = toplamCalismaSaati - mesaiSiniri * gunSayisi
               maas = Double(gunSayisi * calismaSaati) * calismaSaatUcreti + Double(mesaiSaatleri) * mesaiSaatUcreti
           }
        return maas
    }
    
    /**
     Parametre olarak girilen otopark süresine göre otopark ücreti hesaplayarak geri döndüren metodu
     yazınız.
     • 1 saat = 50 ₺
     • 1 saat aşımından sonra her 1 saat , 10 ₺’dir.
     */
    func otoparkUcretiHesapla(sure : Int) -> Double{
        
        let birSaatUcreti = 50.0
        let saatAsimiUcreti = 10.0
        var ucret: Double = 0.0
        
        if sure <= 1 {
             ucret = birSaatUcreti
        }else{
            ucret = birSaatUcreti + Double(sure - 1) * saatAsimiUcreti
         }
        return ucret
    }
}

let cevaplar = Odev2()
// soru 1
let sonuc = cevaplar.soru1(km: 15.2)
print("1.sorunun sonucu: \(sonuc)")

// soru 2
cevaplar.soru2(kenar1: 5, kenar2: 4)

//Soru 3
let x = 4
print("3.sorunun sonucu: \(x) değerinin faktoriyeli : \(cevaplar.factorial(sayi : x))")

// soru 4
let kelime = "Merhaba"
cevaplar.kacEHarfi(kelime: kelime)

// soru 5
print("iç açı toplam: \(cevaplar.icAciHesapla(kenarSayısı: 4))")

// soru 6
let gunSayisi = 20

let calismaSaati = 8
let calismaSaatUcreti = 40.0
let mesaiSaatUcreti = 80.0
let mesaiSiniri = 150

let maas = cevaplar.maasHesapla(gunSayisi: gunSayisi, calismaSaati: calismaSaati, calismaSaatUcreti: calismaSaatUcreti, mesaiSaatUcreti: mesaiSaatUcreti, mesaiSiniri: mesaiSiniri)
print("Toplam maaş: \(maas) TL")

// soru 7

let otoparkSuresi = 7
let ucret = cevaplar.otoparkUcretiHesapla(sure: otoparkSuresi)
print("Otopark ücreti: \(ucret) TL")


