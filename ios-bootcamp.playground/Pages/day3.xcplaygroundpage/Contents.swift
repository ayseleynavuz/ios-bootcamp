import UIKit

// 3.gun

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ FUNCTIONS ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class Fonksiyonlar{
    // geri dönüş değeri olmayan void
    func selamla1(){
        let sonuc = "Merhabalar"
        print(sonuc)
    }
    
    // geri dönüş değeri olan (return)
    func selamla2() -> String{
        let sonuc = "Merhaba2"
        return sonuc
    }
    
    // parametre
    func selamla3(isim : String){
        let sonuc = "Merhaba \(isim)"
        print(sonuc)
    }
    
    func toplama(sayi1 : Int, sayi2 : Int) -> Int{ // bu func dışarıdan iki değer ister ve int tipinde sonuc döner
        let toplam = sayi1 + sayi2
        return toplam
    }
    // overloading !!! : metodların class içerisinde tekrar tekrar kullanılması anlamına gelir
    func carpma(sayi1 : Int, sayi2 : Int){
        print("çarpım: \(sayi1 * sayi2)")
    }
    
    func carpma(sayi1 : Double, sayi2 : Double){
        print("çarpım: \(sayi1 * sayi2)")
    }
    func carpma(sayi1 : Double, sayi2 : Double, isim : String){
        print("çarpım: \(sayi1 * sayi2) işlemi yapan \(isim)")
    }
}

let f = Fonksiyonlar()
f.selamla1()

let gelenSonuc = f.selamla2()
print(gelenSonuc)

f.selamla3(isim: "isimisim")
let gelenToplam = f.toplama(sayi1: 10, sayi2: 5)


// static - enumaration - composition


// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ STATIC ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// static degisken ve metod : class ismiyle erişim sağlanan metod ve değişkenlerdir.
// It gives access to variables and methods via class name

// static ve virtual object farkı inceleniyor.

// sanal nesne örnegi

class ASinifi{
    var x = 10
    
    func metod(){
        print("metod çalıştı")
    }
}


// 1.örnek

let aSinifi = ASinifi() // nesne oluştu, a 'ya aktarıldı, aynı nesne ile hem x hem de metod çalıştırıldı. Kullanım olarak 2.örneğe göre daha pratiktir. Performans açısından da faydalıdır.
print(aSinifi.x)
aSinifi.metod()

// 2.örnek -> iki nesne oluşturuluyor

print(ASinifi().x)  // bu tanımlama:  sanal nesne - virtual object - isimsiz nesne
//-> nedeni let aSinifi = ASinifi() örneğindeki gibi bir değişkene aktarmıyoruz
ASinifi().metod()


// static keyword örneği

// class ismiyle parantez olmadan nesneye, değişkenlere, metodlara erişim.
// It gives access to variables and methods via class name

 class A2Sinifi {
     static var x = 10

     static func metod() {
         print("Method calisti")
     }
 }

let aSinifi2 = A2Sinifi()
print(A2Sinifi.x)    //there is no paranthesis
A2Sinifi.metod()




//~ ~ ~ ~ ~ ~ ~ ~ ~ ~ Enumeration~ ~ ~ ~ ~ ~ ~ ~ ~ ~

enum KonserveBoyut{
    case kucuk
    case orta
    case buyuk
}


func ucretHesapla(boyut : KonserveBoyut , adet : Int){
    switch boyut {
    case KonserveBoyut.kucuk: print("adet: \(adet * 10 )")
    case .orta: print("adet: \(adet * 20 )")
    case .buyuk: print("adet: \(adet * 30 )")
    }
}

ucretHesapla(boyut: .orta, adet: 100)
    

// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ COMPOSITION ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// özellikle veritabanı işlemleri yapıldığında karşımıza çıkar.
// foreign key varsa composition kullanılması gereklidir.
//


// kategoriler tablosuna ait bir class

class Kategoriler{
    var kategori_id : Int?
    var kategori_ad : String?
    
    init(kategori_id: Int? = nil, kategori_ad: String? = nil) {
        self.kategori_id = kategori_id
        self.kategori_ad = kategori_ad
    }
}


// yonetmenler tablosuna ait class

class Yonetmenler{
    var yonetmen_id : Int?
    var yonetmen_ad : String?
    
    init(yonetmen_id: Int? = nil, yonetmen_ad: String? = nil) {
        self.yonetmen_id = yonetmen_id
        self.yonetmen_ad = yonetmen_ad
    }
}

// filmler tablosu

class Filmler{
    var film_id : Int?
    var film_ad : String?
    var film_yil : Int?
    
    // kategori id ve yonetmen_id 'ye erişmek için
    var kategori : Kategoriler?
    var yonetmen : Yonetmenler?
    
    init(film_id: Int? = nil, film_ad: String? = nil, film_yil: Int? = nil, kategori: Kategoriler? = nil, yonetmen: Yonetmenler? = nil) {
        self.film_id = film_id
        self.film_ad = film_ad
        self.film_yil = film_yil
        self.kategori = kategori
        self.yonetmen = yonetmen
    }
}


let k1 = Kategoriler(kategori_id: 1, kategori_ad: "Dram")
let k2 = Kategoriler(kategori_id: 2, kategori_ad: "Bilim Kurgu")


let y1 = Yonetmenler(yonetmen_id: 1, yonetmen_ad: "Quentin Tarantino")
let y2 = Yonetmenler(yonetmen_id: 2, yonetmen_ad: "Christopher Nolan")


let f1 = Filmler(film_id: 1, film_ad: "Interstellar", film_yil: 2019, kategori: k2, yonetmen: y2)


print("Film id : \(f1.film_id!)")
print("Film adı : \(f1.film_ad!)")
print("Film yılı : \(f1.film_yil!)")
print("Film kategori : \(f1.kategori!.kategori_ad!)") //composition - iç içe erişme
print("Film yönetmen : \(f1.yonetmen!.yonetmen_ad!)")




// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ INHERITANCE ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
// Kalıtım : bir sınıftan basşka bir sınıfa özellik aktarmak
// üst sınıf: superclass , alt sınıf: subclass



class Ev{
    var pencereSayisi : Int?
    init(pencereSayisi: Int? = nil) {
        self.pencereSayisi = pencereSayisi
    }
}


class Saray : Ev{
    var kuleSayisi : Int?
    init(kuleSayisi: Int? , pencereSayisi : Int?) {
        self.kuleSayisi = kuleSayisi
        super.init(pencereSayisi: pencereSayisi)
    }
}


class Villa : Ev{
    var garajVarMi : Bool?
    init(garajVarMi: Bool?, pencereSayisi : Int?) {
        self.garajVarMi = garajVarMi
        super.init(pencereSayisi: pencereSayisi)
    }
}


let topkapiSarayi = Saray(kuleSayisi: 5, pencereSayisi: 300)

let bogazVilla = Villa(garajVarMi: true, pencereSayisi: 30)


print(topkapiSarayi.kuleSayisi!)
print(topkapiSarayi.pencereSayisi!)

print(bogazVilla.garajVarMi!)
print(bogazVilla.pencereSayisi!)



//  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ OVERRIDE  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

class Hayvan {
    func sesCikar() {
        print("Sesim yok")
    }
}

class Memeli : Hayvan {

}

class Kedi : Memeli {
    override func sesCikar() {
        print("Miyav miyav")
    }
}

class Kopek : Memeli {
    override func sesCikar() {
        print("Hav hav")
    }
}

let hayvan = Hayvan()
let memeli = Memeli()
let kedi = Kedi()
let kopek = Kopek()


hayvan.sesCikar()  // kalıtım yok, kendi fonksiyonunu çalıştırdı.
memeli.sesCikar()  // kalıtım var, üst sınıfın fonksiyonunu çalıştırdı.
kedi.sesCikar()    // kalıtım var, kendi metodunu çalıştırdı.
kopek.sesCikar()   // kalıtım var, kendi metodunu çalıştırdı.




// is : (Type Checking) Tip kontrolü için kullanılır.(javadaki instance of
// metodu gibi)
// as : (Upcasting ) bir tipi başka bir tipe dönüştürmek için kullanılır
// as! : ( Force Downcasting ) bir tipi başka bir tipe dönüştürmek için
// kullanılır. Dönüşüm sırasında başarısız olursa hata, başarılı ise değeri
// dönüştürür.
// as? : (For Optional downcasting) Dönüşüm sırasında optional bir veri
// geliyorsa. Dönüşüm sırasında başarısız olursa nil , başarılı ise değeri
// dönüştürür.


// Upcasting : alt class üst classa dönüşmesi

var ev = Saray(kuleSayisi: 3, pencereSayisi: 10) as Ev  // saray eve dönüştürülür, üst classa dönüşür

// Downcasting : üst classın alt clasaa dönüşmesi

var saray = Ev(pencereSayisi: 6) as? Saray  // ? ya da ! konulabilir

// tip kontrolü

if ev is Ev{ // bu nesne Ev 'den mi türedi kontrolü yapılıyor
    print("nesne Ev sınıfındandır.")
}else{
    print("nesne Ev sınıfından değildir.")
}


//  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ PROTOCOL (INTERFACE)  ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// PROTOCOL (INTERFACE iki farklı sayfadan erişimler için kullanıyoruz


// değişkenler ve metodlar tanımlanırken taslak olarak tanımlanıyorlar.

protocol MyProtocol{
    var degisken : Int{get set}  // get:değer atayabilirsin,  set: değer okuyabilirsin
    func metod1()
    func metod2() -> String
}


class ClassA : MyProtocol{  // , ile birden fazla protocol eklenebilir
    // conform to protocol uyarısını not edin! ->  o classa protocol ekledik ama kullanılması gereken degisken ve metodları kullanmadık.
    var degisken: Int = 10
    
    func metod1() {
        print("metod1 çalıştı")
    }
    
    func metod2() -> String {
        return "metod2 çalıştı"
    }
    
}

var a = ClassA()
print(a.degisken)
a.metod1()
print(a.metod2())



// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ EXTENSION ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// --> Kotlin dilinde -> infix fonksiyonu (androidde de var)
// var olan yapılara özellik ekliyoruz
// sistemde birçok class var ve biz kendimiz de bir şeyler yazabiliriz. Var olan sisteme extend edilebilir, katkıda bulunabiliriz.
// yazdığımız classları daha modüler hale getirmek için extensionlar kullanılır.


extension Int {
    func carp(sayi : Int) -> Int{
        return self * sayi       // self Int'i temsil ediyor, genişletmek istenen classı
    }
}
let x = 3.carp(sayi: 5)
print(x)


// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ CLOSURE ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

// fonksiyona benziyor

var ifade = {
    print("Closure kullanımı")
}

ifade()
