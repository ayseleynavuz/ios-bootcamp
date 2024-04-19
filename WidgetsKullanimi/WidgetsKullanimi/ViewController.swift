//
//  ViewController.swift
//  WidgetsKullanimi
//
//  Created by Aleyna on 19.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var labelSonuc: UILabel!
    
    @IBOutlet weak var textFieldGirdi: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var mSwitch: UISwitch!
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func buttonYap(_ sender: Any) {
        
        if let alinanVeri = textFieldGirdi.text {
            labelSonuc.text = alinanVeri
        }
        
    }
    
    
    
    @IBAction func buttonMutlu(_ sender: Any) {
        imageView.image = UIImage(named: "Mutlu")
    }
    
    
    @IBAction func buttonUzgun(_ sender: Any) {
        imageView.image = UIImage(named: "Uzgun")
    }
    
    
    
    
    @IBAction func switchDegisim(_ sender: UISwitch) {
        
        if sender.isOn{
            print("switch on")
        }else{
            print("switch of")
        }
    }
    
    
    
    
    @IBAction func segmentedDegisim(_ sender: UISegmentedControl) {
        
        let secilenIndeks = sender.selectedSegmentIndex
        let secilenKategori = sender.titleForSegment(at: secilenIndeks)
        print("Seçim: \(secilenKategori!)")
    }
    
    
    
    @IBAction func buttonGoster(_ sender: Any) {
        
        print("Switch Durum: \(mSwitch.isOn)")
        
        let secilenIndeks = segmentedControl.selectedSegmentIndex
        let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
        print("Seçim: \(secilenKategori!)")
        
    }
    
}

