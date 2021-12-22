//
//  AnasayfaTableViewCell.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import UIKit

class AnasayfaTableViewCell: UITableViewCell {

    @IBOutlet weak var anasayfaFiyatLabel: UILabel!
    @IBOutlet weak var anasayfaYemekLabel: UILabel!
    
    @IBOutlet weak var anasayfaYemekİmage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
