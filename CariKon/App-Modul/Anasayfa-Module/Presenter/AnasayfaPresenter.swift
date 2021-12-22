//
//  AnasayfaPresenter.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
}
extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi: Array<yemekler>) {
        anasayfaView?.vieweVeriGonder(yemeklerListesi: yemeklerListesi)
    }
}
