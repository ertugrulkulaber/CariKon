//
//  ViewController.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import UIKit
import Kingfisher
class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!

    var yemekListe = [yemekler]()
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    var sepetimPresenterNesnesi:ViewToPresenterSepetProtocol?
    var FiltreYemeklerListe = [yemekler]()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationItem.title = "CARİKON"
        let apperance = UINavigationBarAppearance()
        apperance.backgroundColor = UIColor(named:"kullanicagimAnaRenk")
        apperance.titleTextAttributes = [.foregroundColor:UIColor(named: "yaziRenk2")!,NSAttributedString.Key.font : UIFont(name: "LibreBaskerville-Regular", size: 36)!]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        AnasayfaRouter.createModule(ref: self)
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    override func viewWillAppear(_ animated: Bool) {

        
    }
  
}
extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<yemekler>) {
        self.yemekListe = yemeklerListesi
        self.FiltreYemeklerListe = yemekListe
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
   
}
extension AnasayfaVC:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            self.FiltreYemeklerListe = self.yemekListe.filter{yemek in
                if yemek.yemek_adi!.lowercased().contains(searchText.lowercased()){
                    return true
                }
                if searchText == ""{
                    return true
                }
                return false
            }
            self.tableView.reloadData()
        }
}
extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FiltreYemeklerListe.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = FiltreYemeklerListe[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucre", for: indexPath) as! AnasayfaTableViewCell
        cell.anasayfaYemekLabel.text = "\(yemek.yemek_adi!) "
        cell.anasayfaFiyatLabel.text = "\(yemek.yemek_fiyat!)₺"
        cell.anasayfaYemekİmage.kf.setImage(with: URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)"))
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0
        cell.layer.cornerRadius = 15
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemekListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yemek = sender as? yemekler
            let toVC = segue.destination as! DetayVC
            toVC.yemek = yemek
        }
    }
}

