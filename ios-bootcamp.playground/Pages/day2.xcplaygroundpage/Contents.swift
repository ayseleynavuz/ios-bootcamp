

import UIKit

var greeting = "Hello, playground"


// ---------------------  2.gun  ------------------------------------//

// if - else

var ka = "admin"
var pass = "123456"

if(ka == "admin" && pass == "123456"){
    print("hosgeldiniz")
}else{
    print("hatali giris yapildi")
}

// switch - case

var gun = 3
switch gun {
case 1 : print("pazartesi")
case 2 : print("sali")
case 3 : print("car")
case 4 : print("per")
case 5 : print("cum")
default: print("böyle bir gun yok")

}


var a = 40
var b = 50
var x = 90
var y = 80

// donguler
// 1,2,3
for i in 1...3{  // kotlinde 1..3 şeklindedir
    print("dongu 1: \(x)")
}

for a in stride(from: 10, through: 20, by: 5){
    print("dongu 2: \(a)")
}

for b in stride(from: 10, through: 20, by: -5){
    print("dongu 3: \(b)")
}


var sayac = 1
while sayac < 4 {
    print("dongu 4 : \(sayac)")
    sayac+=1
}

// break - continue

for i in 1...5{
    if i == 3 {
        break
    }
    print("dongu 5: \(i)") //1,2
}

for i in 1...5{
    if i == 3 {
        continue
    }
    print("dongu6: \(i)") // 1,2,4,5
}


// optional = null safety = nullable

// tanımlama
var mesaj = "Merhaba"

//null, nil
//var str : String? = nil
// nil olma ihtimali olan bir değişkense ? kullanılır, optional bir ifadedir.
var str : String?

if str != nil{
    print(str!) // unwrap
}else{
    print("str nil değer içeriyor")
}



// optional binding
if let temp = str {
    print(temp) // otomatik unwrap
}else{
    print("str nil değer içeriyor")
}

// nesne tabanlı programlama

class Araba{
    //var renk = "kirmizi"
    //var hız = 100
    //var calisiyorMu = true
    
    var renk : String?
    var hiz : Int?
    var calisiyorMu : Bool?
    
    
    // contructor
    
    init(renk: String? = nil, hiz: Int? = nil, calisiyorMu: Bool? = nil) {
        self.renk = renk  // self bulunduğu sınıfı temsil ediyor. kotlin, java da this kullanılır.
        self.hiz = hiz
        self.calisiyorMu = calisiyorMu  // bu tanımlamaya shadowing(gölgeleme) denir.
    }
    
    func bilgiAl(){
        print("*************")
        print("Renk           : \(renk!)")
        print("Hız            : \(hiz!)")
        print("Çalışıyor mu   : \(calisiyorMu!)")
    }

    func calistir(){ // side effect : func ile classın değişkenlerinin içeriğini değiştirebiliyorsak side effect denir.
        calisiyorMu = true
        hiz = 5
    }
    func durdur() {
        calisiyorMu = false
        hiz = 0
    }
    
    func hizlan(kacKm : Int){
        hiz! += kacKm
    }
    
    func yavasla(kacKm:Int) {
        hiz!-=kacKm
    }
}

// nesne olusturma

/*var bmw = Araba()
var tesla = Araba()
*/

var tesla = Araba(renk: "mavi", hiz: 150,calisiyorMu: true)


// değer atama
/*bmw.renk = "kırmızı"
bmw.hiz = 100
bmw.calisiyorMu = true
*/


// değer okuma
tesla.bilgiAl()
tesla.calistir()
tesla.durdur()


