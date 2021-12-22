//
//  DetayRouter.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import Foundation

class DetayRouter :PresenterToRouterDetayProtocol {
    static func createModule(ref: DetayVC) {
        ref.yemekDetayPresenterNesnesi = DetayPresenter()
        ref.yemekDetayPresenterNesnesi?.sepetInteractor = DetayInteractor()
    }
}

