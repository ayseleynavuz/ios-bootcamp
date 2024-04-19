//
//  ViewController.swift
//  KullaniciEtkilesimi
//
//  Created by Aleyna on 18.04.2024.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)
        
        
        // iptal için
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in  // cancel mavi görünür
            // butona tıklandığında işlem olacaksa
            // action. -> diye kullanılır
            print("İptal seçildi.")
        }
        alertController.addAction(iptalAction)
        
        
        //tamam için
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){ action in  // destructive kırmızı görünür
            print("Tamam seçildi.")
        }
        alertController.addAction(tamamAction)
      
        
        
        
        self.present(alertController, animated: true)
    }
    
    
    
    @IBAction func buttonActionSheet(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .actionSheet)  // burada farklılık yapıldı
        
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in  // cancel mavi görünür
            print("İptal seçildi.")
        }
        alertController.addAction(iptalAction)
        
    
        let tamamAction = UIAlertAction(title: "Tamam", style: .destructive){ action in  // destructive kırmızı görünür
            print("Tamam seçildi.")
        }
        alertController.addAction(tamamAction)
      
        
        self.present(alertController, animated: true)
        
    }
    
    
    
    @IBAction func buttonOzelAlert(_ sender: Any) {
        
        
        let alertController = UIAlertController(title: "Başlık", message: "Mesaj", preferredStyle: .alert)  // burada farklılık yapıldı
        
        alertController.addTextField(){ textField  in  // indexi 0
            textField.placeholder = "Veri giriniz: "
            textField.keyboardType = .numberPad  // sadece sayılar
            textField.isSecureTextEntry = true // şifre girerken karakteri göstermiyor
        }
        
        alertController.addTextField()  // indexi 1
        
        let tamamAction = UIAlertAction(title: "Kaydet", style: .destructive){ action in  // destructive kırmızı görünür
            
            let tf = alertController.textFields![0] as UITextField
            let tf1 = alertController.textFields![1] as UITextField
            
            if let alinanVeri = tf.text, let alinanVeri1 = tf1.text{
                print("Veri : \(alinanVeri) ve \(alinanVeri1)")
            }
          
        }
        alertController.addAction(tamamAction)
      
        
        self.present(alertController, animated: true)
        
    }
    
    
    
    
    
}

