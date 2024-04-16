//
//  ViewController.swift
//  odev3
//
//  Created by Aleyna on 16.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // renklendirme için
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "bgColor")
        
        appearance.titleTextAttributes = [.foregroundColor : UIColor(named: "textColor")!, .font: UIFont(name: "Poppins-Regular", size: 22)]
               
        // status bar
        // tema siyah seçilir, telefon saati, pil durumu beyaz renkli görünür.
        navigationController?.navigationBar.barStyle = .black
               
        // telefonlardaki farkdan dolayı(çentik, su damlası vb.) tasarım hatası almamak için.
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        
    }


}

