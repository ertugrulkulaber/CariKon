//
//  AnasayfaInteractor.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation
import Alamofire
import Kingfisher
class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    func tumYemekleriAl() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON{ response in
                    if let data = response.data{
                        do{
                            let cevap = try JSONDecoder().decode(yemeklerCevap.self, from: data)
                            var liste = [yemekler]()
                            if let gelenListe = cevap.yemekler{
                                liste = gelenListe
                                
                            }
                            self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi:liste)
                        }catch{
                            print(error.localizedDescription)
                }
            }
        }
    }
}
