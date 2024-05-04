//
//  ViewController.swift
//  Date&TimePickerKullanimi
//
//  Created by Aleyna on 4.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tfSaat: UITextField!
    
    @IBOutlet weak var tfTarih: UITextField!
    
    
    var datePicker : UIDatePicker?
    var timePicker : UIDatePicker?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        tfTarih.inputView = timePicker
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .time
        tfSaat.inputView = timePicker
        
        // 13.4 ve sonraı için de wheels gösterimi kullanılsın
        if #available(iOS 13.4, *){
            datePicker?.preferredDatePickerStyle = .wheels
            timePicker?.preferredDatePickerStyle = .wheels
        }
        
        
        // ekrana dokunulduğu zaman metodu çalıştıracak
        // selector ile çalıştıracaksak objc ön eki olmak zorundadır
        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilamaMetod))
        view.addGestureRecognizer(dokunmaAlgilama)
        
        datePicker?.addTarget(self, action: #selector(tarihGoster(uiDatePicker:)), for: .valueChanged)
        timePicker?.addTarget(self, action: #selector(saatGoster(uiDatePicker:)), for: .valueChanged)
        
    }
    
    
    @objc func dokunmaAlgilamaMetod (){
        print("ekrana dokunuldu.")
        view.endEditing(true) // sayfa üzerinde açılmış yapıları kapatmak için kullanılır
        
    }
    
    @objc func tarihGoster (uiDatePicker : UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "MM/dd/yyyy"
        let alinanTarih = format.string(from: uiDatePicker.date)
        tfTarih.text = alinanTarih
    }
    
    @objc func saatGoster (uiDatePicker : UIDatePicker){
        let format = DateFormatter()
        format.dateFormat = "HH:mm"
        let alinanSaat = format.string(from: uiDatePicker.date)
        tfSaat.text = alinanSaat
    }

}

