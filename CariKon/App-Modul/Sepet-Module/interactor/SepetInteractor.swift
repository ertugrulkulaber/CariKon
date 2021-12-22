//
//  SepetInteractor.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation
import Alamofire
import Kingfisher

class SepetInteractor :PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func tumYemekleriAl() {
        let params:Parameters = ["kullanici_adi":"ertu"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php",method: .post,parameters: params).responseJSON{  response in
            if let mydata = response.data {
                do {
                    let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: mydata)
                    
                    var liste = [Sepet_yemekler]()
                    if let gelenListe = cevap.sepet_yemekler{
                        liste = gelenListe
                        print(liste)
                    }
                    self.sepetPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                }catch {
                    self.sepetPresenter?.presenteraVeriGonder(yemeklerListesi: [])
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func yemekSil(sepet_yemek_id: Int,kullanici_adi: String) {
        let params:Parameters = ["sepet_yemek_id":sepet_yemek_id,"kullanici_adi":"ertu"]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON{  response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                self.tumYemekleriAl()
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
    }
    }
}
