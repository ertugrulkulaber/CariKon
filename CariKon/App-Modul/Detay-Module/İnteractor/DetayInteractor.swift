//
//  DetayInteractor.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation
import Alamofire

class DetayInteractor : PresenterToInteractorDetayProtocol {
  
    
    func sepeteEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_siparis_adet: Int, kullanici_adi: String) {
        
        let params:Parameters = ["yemek_adi":yemek_adi,"yemek_resim_adi":yemek_resim_adi,"yemek_fiyat":yemek_fiyat,"yemek_siparis_adet":yemek_siparis_adet,"kullanici_adi":"ertu"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).responseJSON{  response in
            if let data = response.data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }        }
    }
}
    
    

