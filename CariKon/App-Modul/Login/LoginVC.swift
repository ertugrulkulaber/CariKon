//
//  LoginVC.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 18.12.2021.
//

import UIKit

class LoginVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
 
    @IBAction func girisButton(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBarID") as! UITabBarController;         vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
}
