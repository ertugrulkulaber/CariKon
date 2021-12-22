//
//  DetayVC.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import UIKit
import Kingfisher
import Alamofire
class DetayVC: UIViewController {
    

    @IBOutlet weak var StepperLabel: UILabel!
    @IBOutlet weak var Stepper: UIStepper!
    @IBOutlet weak var DetayFiyat: UILabel!
    @IBOutlet weak var Detayİmage: UIImageView!
    @IBOutlet weak var yemekBaslikLabel: UILabel!
    
    var yemek:yemekler?
    var yemeksepet :Sepet_yemekler?
    var yemekDetayPresenterNesnesi:ViewToPresenterDetayProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DetayRouter.createModule(ref: self)
        if let yem = yemek {
            
            yemekBaslikLabel.text = "\(yem.yemek_adi!)"
            DetayFiyat.text = yem.yemek_fiyat!
            Detayİmage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yem.yemek_resim_adi!)"))
            
        }
        DetayRouter.createModule(ref: self)
    }
    @IBAction func SepeteEkleButton(_ sender: Any) {
        
        if (Int(StepperLabel.text!) == nil ) {
            let alert = UIAlertController(title: "hata!", message: "lutfen adet seciniz", preferredStyle: .alert)
                       let iptalAction = UIAlertAction(title: "Tamam", style: .cancel){ action in
                       }
                       alert.addAction(iptalAction)
                       self.present(alert, animated: true)
        }else {
        if let ka = yemekBaslikLabel.text ,let kt = DetayFiyat.text ,let da = StepperLabel.text{
            
    yemekDetayPresenterNesnesi?.Ekle(yemek_adi: ka, yemek_resim_adi: (yemek?.yemek_resim_adi)!, yemek_fiyat: Int(kt)!, yemek_siparis_adet: Int(da)!, kullanici_adi: "ertu")
            
            print("Sepete Eklendi")
        }
        }
        
    }
    @IBAction func StepperButton(_ sender: UIStepper) {
        
            StepperLabel.text = "\(Int(sender.value))"
    }
    
}
