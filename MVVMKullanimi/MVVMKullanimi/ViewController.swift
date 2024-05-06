//
//  ViewController.swift
//  MVVMKullanimi
//
//  Created by Aleyna on 4.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var labelSonuc: UILabel!
    @IBOutlet weak var textfieldSayi1: UITextField!
    @IBOutlet weak var textfieldSayi2: UITextField!
    
    var viewModel = AnasayfaViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = viewModel.sonuc.subscribe(onNext: { s in  // dinleme
            // s burada sonuc
            self.labelSonuc.text = s
        })
    }
    
    @IBAction func buttonTolama(_ sender: Any) {
        if let alinanSayi1 = textfieldSayi1.text, let alinanSayi2 = textfieldSayi2.text{
            viewModel.toplamaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
    }
    
    @IBAction func buttonCarpma(_ sender: Any) {
        if let alinanSayi1 = textfieldSayi1.text, let alinanSayi2 = textfieldSayi2.text{
            viewModel.carpmaYap(alinanSayi1: alinanSayi1, alinanSayi2: alinanSayi2)
        }
    }
}

