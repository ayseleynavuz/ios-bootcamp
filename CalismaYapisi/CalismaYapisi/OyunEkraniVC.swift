//
//  OyunEkraniVC.swift
//  CalismaYapisi
//
//  Created by Aleyna on 15.04.2024.
//

import UIKit

class OyunEkraniVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    @IBAction func buttonBitir(_ sender: Any) {
        performSegue(withIdentifier: "sonucEkraninaGecis", sender: nil)
    }
    
    
    @IBAction func buttonGeri(_ sender: Any) {
        // gecis show ise kullanılır
        //navigationController?.popViewController(animated: true) // pop-bir önceki sayfaya dön
        navigationController?.popToRootViewController(animated: true) // anasayfaya dön
    }
    
}
