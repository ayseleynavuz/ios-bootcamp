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
    
    @IBOutlet weak var labelSlider: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
    @IBOutlet weak var labelStepper: UILabel!
    
    @IBOutlet weak var stepper: UIStepper!
    
    
    
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelSlider.text = String(Int(slider.value)) // sayfa yuklendiginde başlangıç değerini göstermesi için
        labelStepper.text = String(Int(stepper.value))
        indicator.isHidden = true // ilk çalıştıgında görünmez olması için
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
    
    
    
    @IBAction func sliderDegisim(_ sender: UISlider) {
        labelSlider.text = String(Int(sender.value))  // label'a değer aktarıyoruz, sender sayısal olduğu için string dönüşümü yapılıyor. Value : ondalıklı sayı verir.
        // ondalıklı sayı string'e çevrildi ve label'a aktardık. Int dönüşü ile çözülür.
    }
    
    
    
    @IBAction func stepperDegisim(_ sender: UIStepper) {
        labelStepper.text = String(Int(sender.value))
    }
    

    
    @IBAction func buttonBasla(_ sender: Any) {
        indicator.isHidden = false
        indicator.startAnimating()
    }
    
    
    @IBAction func buttonDur(_ sender: Any) {
        indicator.isHidden = true
        indicator.stopAnimating()
    }
    
    
    
    
    
    
    
    @IBAction func buttonGoster(_ sender: Any) {
        
        print("Switch Durum: \(mSwitch.isOn)")
        
        let secilenIndeks = segmentedControl.selectedSegmentIndex
        let secilenKategori = segmentedControl.titleForSegment(at: secilenIndeks)
        print("Segmented Durum: \(secilenKategori!)")
        
        print("Slider Durum: \(slider.value)")
        print("Stepper Durum: \(stepper.value)")
        
    }
    
    
}

