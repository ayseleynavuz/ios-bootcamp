//
//  ViewController.swift
//  CalismaYapisi
//
//  Created by Aleyna on 15.04.2024.
//

import UIKit

class AnasayfaVC: UIViewController {
    
   
    @IBOutlet weak var labelAnasayfa: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelAnasayfa.text = "Hosgeldin" // sayfa açıldığında text' e değer atanabilir.
    }

  
    @IBAction func buttonYap(_ sender: Any) {
        labelAnasayfa.text = "Merhaba"  // butona tıklanınca ekranda yazacak text
    }
    
    
    
    @IBAction func buttonBasla(_ sender: Any) {
        performSegue(withIdentifier: "oyunEkraninaGecis", sender: nil)
    }
    
    
    
    
}



