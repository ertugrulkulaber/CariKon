//
//  DetayProtocols.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    var sepetInteractor:PresenterToInteractorDetayProtocol? {get set}
    func Ekle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)
    
}
protocol PresenterToInteractorDetayProtocol {
    func sepeteEkle(yemek_adi:String,yemek_resim_adi:String,yemek_fiyat:Int,yemek_siparis_adet:Int,kullanici_adi:String)
}
protocol PresenterToRouterDetayProtocol {
    static func createModule(ref:DetayVC)
}
