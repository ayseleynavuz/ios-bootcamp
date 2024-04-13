import UIKit



// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ COLLECTIONS ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// Array, Set, Dictionary  'den oluşur.

// Set yapısı itibariyle vari aktarıldıkça sırayla eklenmez, karıştırılır (Array le 1. farkı)
   //-> karıştırma algoritması gerekliyse kullanılır.Spotify müzik listesindeki karıştırma özelliği gibi.

// Set aynı verinin tekrarlanmasını istemez. içeride Jazz varsa tekrar eklenmeye çalışıyorsa eklemez siler (2. farkı)
   // set de veri tekrarı yoktur , array de istediğin kadar tekrarlarsın.

// Dictionary de index i, key i, kendimiz belirliyoruz  (birçok dilde hash map olarak da geçer)
  // arraydeki bazı eksikliklerden doalyı çıkmış bir yapıdır.
// Dictionary i biz çok kullanmıyoruz genelde sistem bizden istediğinde kullanıyoruz




//  ~ ~ ~ ~ ~  ARRAY KULLANIMI ~ ~ ~ ~ ~

// ilk index 0 dan başlar.

var numaralar = [10.0,20.0,30.0]
var sayilar = [Int](repeating: 0, count: 1000)

var meyveler = [String]()       // boş array tanımlama


// Veri ekleme

meyveler.append("Elma")//0.
meyveler.append("Muz")//1.
meyveler.append("Kiraz")//2.

print(meyveler)


// Veri Okuma

print(meyveler[2])
let m = meyveler[0]
print(m)

// Insert

meyveler.insert("Portakal", at: 1)  // 1.indexe portakal yerleştir, diğerlerini kaydırır
print(meyveler)



print(meyveler.isEmpty)//Boş mu?
print(meyveler.count)//boyutunu

print(meyveler.first!)//0. index - ilk eleman
print(meyveler.last!)//son eleman
print(meyveler.contains("Muzd"))


// Veri Silme

meyveler.remove(at: 1)  // 1.indexdeki değeri siler.
print(meyveler)

 
meyveler.removeAll()  // tamamen siler.
print(meyveler)



// döngülerin çalışma şekli

for meyve in meyveler {
    print("Sonuç 1 : \(meyve)")
}

// index ile çalışma şekli -> Kotlinde withIndex'dir.

for (indeks, meyve) in meyveler.enumerated() {    //hem içeriği hem index i döndürecek
    print("\(indeks). -> \(meyve)")
}

// Nesne Tabanlı

class Ogrenciler {
    var no:Int?
    var ad:String?
    var sinif:String?

    init(no:Int,ad:String,sinif:String) {
        self.no = no
        self.ad = ad
        self.sinif = sinif
    }
}

var o1 = Ogrenciler(no: 200, ad: "Asli", sinif: "9C")
var o2 = Ogrenciler(no: 300, ad: "Leyla", sinif: "11Z")
var o3 = Ogrenciler(no: 100, ad: "Arda", sinif: "12A")


var ogrencilerListesi = [Ogrenciler]()

ogrencilerListesi.append(o1)
ogrencilerListesi.append(o2)
ogrencilerListesi.append(o3)


for o in ogrencilerListesi {
    print("No : \(o.no!) - Ad : \(o.ad!) - Sınıf : \(o.sinif!)")
}


// Filtreleme : Önemli bir kavramdır
// elimizde bir array varsa
var f1 = ogrencilerListesi.filter({ $0.no! > 100 && $0.no! < 250})
print("filtreleme1")

for o in f1 {
    print("No : \(o.no!) - Ad : \(o.ad!) - Sınıf : \(o.sinif!)")
}



var f2 = ogrencilerListesi.filter({ $0.ad!.contains("y")})
print("filtreleme2")

for o in f2 {
    print("No : \(o.no!) - Ad : \(o.ad!) - Sınıf : \(o.sinif!)")
}


// Sıralama - Sorting

var s1 = ogrencilerListesi.sorted(by: {$0.no! > $1.no! })  // no arasında sıralama yapılacak
print("Sayısal büyükten küçüğe sıralama")

for o in s1 {
    print("No : \(o.no!) - Ad : \(o.ad!) - Sınıf : \(o.sinif!)")
}


var s2 = ogrencilerListesi.sorted(by: {$0.no! < $1.no! })  // no arasında sıralama yapılacak
print("Sayısal küçükten büyüğe sıralama")

for o in s2 {
    print("No : \(o.no!) - Ad : \(o.ad!) - Sınıf : \(o.sinif!)")
}


var s3 = ogrencilerListesi.sorted(by: {$0.ad! > $1.ad! })  // no arasında sıralama yapılacak
print("Metinsel büyükten küçüğe sıralama")

for o in s3 {
    print("No : \(o.no!) - Ad : \(o.ad!) - Sınıf : \(o.sinif!)")
}


var s4 = ogrencilerListesi.sorted(by: {$0.ad! > $1.ad! })  // no arasında sıralama yapılacak
print("Metinsel küçükten büyüğe sıralama")

for o in s4 {
    print("No : \(o.no!) - Ad : \(o.ad!) - Sınıf : \(o.sinif!)")
}



//  ~ ~ ~ ~ ~  COLLECTIONS 2  ~ ~ ~ ~ ~
//  Set - Dictionary - Guard - Do Try Catch


// SET KULLANIMI

var meyveler1 = Set<String>()
meyveler1.insert("Elma")
meyveler1.insert("Portakal")
meyveler1.insert("Muz")

print(meyveler1)    //sıraları karışık olacak

meyveler1.insert("Elma")
print(meyveler1)    //aynı veri tekrar eklenemez

meyveler1.insert("Amasya Elma")
print(meyveler1)

for meyve in meyveler1 {
    print("Sonuç 1 : \(meyve)")
}

for (indeks, meyve) in meyveler1.enumerated() {
    print("\(indeks). -> \(meyve)")
}

print("Boyut: \(meyveler1.count)")
print("Boş mu?: \(meyveler1.isEmpty)")



// HASHMAP - MAP - DICTIONARY

var iller = [Int:String]()  // Int -> key  |  String -> değer,value

// Veri Ekleme
iller[16] = "Bursa"
iller[34] = "İstanbul"

print(iller)

// Veri Okuma
print(iller[16]!)


// Güncelleme
iller[16] = "Yeni Bursa"
print(iller)

for (anahtar, deger) in iller {
    print("Anahtar : \(anahtar) - Değer : \(deger)")
}

// Değer silme
iller.removeValue(forKey: 16)
print(iller)




// * * * * * * * * * İLERİ SWIFT * * * * * * * * *
// GUARD, EXCEPTION , DO - TRY - CATCH, THREAD

// GUARD
// if in tersi -> yani yanlışsa içeri girecek, false durumunda çalışacak.
// bir fonksiyon içerisinde kullanılmak zorunda, fonksiyon olmadan çalışmaz.
// hata yakalama için kolaylık sağlıyor



// if ile örnek

func kisiTanima(ad:String) {
    if ad == "Ahmet" {
        print("Merhaba Ahmet")
    } else {
        print("Tanınmayan kişi")
    }
}

kisiTanima(ad: "Ahmet")

// guard ile örnek

func kisiTanimaGuard(ad:String) {
    guard ad == "Ahmet" else {
        print("Tanınmayan kişi")
        return                  // return kelimesi bu fonksiyonun çalışmasını durdurur
    }
    
    print("Merhaba Ahmet")
}

kisiTanimaGuard(ad: "Ahmetx")



// HATA AYIKLAMA            //try-catch-throw

// 1. compile error: editor hataları
/*
let x = 10
x = 40 */

// 2. runtime error - exception : çalışma sırasında oluşan hatalar, run edildiğinde uygulama çökerse alınan hata
/*
let sonuc = 10 / 0  -> sıfıra bölünmez
*/


enum Hatalar : Error {
    case sifiraBolunmeHatasi
}


// try - catch kullanım
//yapıyı sistem kendi oluşturuyor biz kullanmak zorunda kalıyoruz

func bolme(sayi1:Int,sayi2:Int) throws -> Int {
    if sayi2 == 0 {
        throw Hatalar.sifiraBolunmeHatasi
    }
    return sayi1 / sayi2
}


// kullanım 1

do{
    let sonuc = try bolme(sayi1: 10, sayi2: 1)
    print(sonuc)
}catch  Hatalar.sifiraBolunmeHatasi{
    print("Sayı sıfıra bölünemez.")
}


// kullanım 2

let sonuc1 = try? bolme(sayi1: 10, sayi2: 1)  // eger hata olursa sonuc nil olur

if let temp = sonuc1{
    print(temp)
    
}else{
    print("Sayı sıfıra bölünemez.")
}
