//
//  ViewController.swift
//  TasarimCalismasi
//
//  Created by Aleyna on 14.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()  // sayfa açıldığında ilk açılan metod.
        
        // başlık tanımlama
        self.navigationItem.title = "Pizza"
        
        // renklendirme için
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "mainColor")
        appearance.titleTextAttributes = [.foregroundColor : UIColor(named: "textColor")!, .font: UIFont(name: "Pacifico-Regular", size: 22)]
        
        // status bar
        // tema siyah seçilir, telefon saati, pil durumu beyaz renkli görünür.
        navigationController?.navigationBar.barStyle = .black
        
        // telefonlardaki farkdan dolayı(çentik, su damlası vb.) tasarım hatası almamak için.
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }


}

