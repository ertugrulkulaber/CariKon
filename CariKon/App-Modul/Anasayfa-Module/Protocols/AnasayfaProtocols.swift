//
//  AnasayfaProtocols.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    func yemekleriYukle()
}
protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    func tumYemekleriAl()
}
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemeklerListesi:Array<yemekler>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi:Array<yemekler>)
}
protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref:AnasayfaVC)
}
