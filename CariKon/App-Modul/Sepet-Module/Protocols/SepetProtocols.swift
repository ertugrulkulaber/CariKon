//
//  SepetProtocols.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    var sepetInteractor:PresenterToInteractorSepetProtocol? {get set}
    var sepetView:PresenterToViewSepetProtocol? {get set}
    func yemekleriYukle()
    func sil(sepet_yemek_id:Int,kullanici_adi: String)
}
protocol PresenterToInteractorSepetProtocol {
    var sepetPresenter:InteractorToPresenterSepetProtocol? {get set}
    func tumYemekleriAl()
    func yemekSil(sepet_yemek_id:Int,kullanici_adi: String)
}
protocol InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<Sepet_yemekler>)
}
protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<Sepet_yemekler>)
}
protocol PresenterToRouterSepetProtocol {
    static func createModule(ref:SepetVC)
}
