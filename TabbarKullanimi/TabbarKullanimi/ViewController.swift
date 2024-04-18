//
//  ViewController.swift
//  TabbarKullanimi
//
//  Created by Aleyna on 18.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        if let tabItems = tabBarController?.tabBar.items{
            let anasayfaItem = tabItems[0]
            let ayarlarItem = tabItems[1]
            anasayfaItem.badgeValue = "3"
            anasayfaItem.badgeValue = "Yeni"
        }
        
        
        // arka plan rengi değiştirmek için
        
        let appearance = UITabBarAppearance()
        appearance.backgroundColor = UIColor.systemIndigo
        
        
        
        // hepsi kullanılıyor
        renkDegistir(itemAppearance: appearance.stackedLayoutAppearance)
        renkDegistir(itemAppearance: appearance.inlineLayoutAppearance)
        renkDegistir(itemAppearance: appearance.compactInlineLayoutAppearance)
        
        
        tabBarController?.tabBar.standardAppearance = appearance
        tabBarController?.tabBar.scrollEdgeAppearance = appearance
        
    }
    
    
    func renkDegistir(itemAppearance : UITabBarItemAppearance){
        // seçili durum
        itemAppearance.selected.iconColor = UIColor.systemOrange // icon rengi
        itemAppearance.selected.titleTextAttributes = [.foregroundColor : UIColor.systemOrange ] // text rengi
        itemAppearance.selected.badgeBackgroundColor = UIColor.systemMint
        // seçili olmayan durum
        itemAppearance.normal.iconColor = UIColor.white // icon rengi
        itemAppearance.normal.titleTextAttributes = [.foregroundColor : UIColor.white ] // text rengi
        itemAppearance.normal.badgeBackgroundColor = UIColor.lightGray
    }


}

