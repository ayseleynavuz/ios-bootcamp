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
