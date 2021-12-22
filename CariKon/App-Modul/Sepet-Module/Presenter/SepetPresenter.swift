//
//  SepetPresenter.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    
    func yemekleriYukle() {
        sepetInteractor?.tumYemekleriAl()
    }
    func sil(sepet_yemek_id: Int,kullanici_adi: String) {
        sepetInteractor?.yemekSil(sepet_yemek_id: sepet_yemek_id, kullanici_adi: kullanici_adi)
    }
}
extension SepetPresenter : InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<Sepet_yemekler>) {
        sepetView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
    
    
}
