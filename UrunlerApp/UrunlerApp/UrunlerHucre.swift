//
//  UrunlerHucre.swift
//  UrunlerApp
//
//  Created by Aleyna on 27.04.2024.
//

import UIKit

// protocol
// tetikleyen taraf -> hucre , kullanan taraf -> Anasayfa
// 

protocol HucreProtocol {
    func sepeteEkleTiklandi(indexPath : IndexPath)
}

class UrunlerHucre: UITableViewCell {
    @IBOutlet weak var hucreArkaplan: UIView!
    
    @IBOutlet weak var imageViewUrun: UIImageView!
    
    @IBOutlet weak var labelUrunAd: UILabel!
    
    @IBOutlet weak var labelUrunFiyat: UILabel!
    
    // bu nesneyi dışarıdan istiyoruz
    var hucreProtocol : HucreProtocol?
    var indexpath : IndexPath?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtocol?.sepeteEkleTiklandi(indexPath: indexpath!)
    }
    
    
}
