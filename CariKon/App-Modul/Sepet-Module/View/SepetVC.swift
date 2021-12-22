//
//  SepetVC.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import UIKit
import Kingfisher
import Alamofire
class SepetVC: UIViewController {
    @IBOutlet weak var denemeLAbel: UILabel!
    @IBOutlet weak var ToplamFiyatLabel: UILabel!
    @IBOutlet weak var SepetTableView: UITableView!
    var sepetListe = [Sepet_yemekler]()
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        SepetTableView.delegate = self
        SepetTableView.dataSource = self
        SepetRouter.createModule(ref: self)
        sepetPresenterNesnesi?.sepetInteractor?.tumYemekleriAl()
    }
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.yemekleriYukle()
        toplam()
    }
    func toplam(){
            var toplamUcret = 0
            var ucret = 0
            for yemek in sepetListe{
                ucret = Int(yemek.yemek_fiyat!)! * Int(yemek.yemek_siparis_adet!)!
                toplamUcret += ucret
            }
            self.ToplamFiyatLabel.text = "\(String(toplamUcret)) ₺"
        }
}
extension SepetVC : PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Sepet_yemekler>) {
         self.sepetListe = yemeklerListesi
        DispatchQueue.main.async {
            self.SepetTableView.reloadData()
            self.toplam()
        }
      
    }
}
extension SepetVC : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return sepetListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = sepetListe[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        cell.SepetYemekismiLabel.text = "\(yemek.yemek_adi!)"
        cell.SepetYemekFiyatiLabel.text = "\(yemek.yemek_fiyat!)₺"
        cell.siparisAdetLabel.text = "\(yemek.yemek_siparis_adet!)"
        cell.Sepetİmage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"))
   
    return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let yemek = self.sepetListe[indexPath.row]
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepetPresenterNesnesi?.sil(sepet_yemek_id: Int(yemek.sepet_yemek_id!)!,kullanici_adi: "ertu")
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}



