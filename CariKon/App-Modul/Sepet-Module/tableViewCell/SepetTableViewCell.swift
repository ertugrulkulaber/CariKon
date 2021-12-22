//
//  SepetTableViewCell.swift
//  CariKon
//
//  Created by Ertuğrul Kulaber on 6.12.2021.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

    
    @IBOutlet weak var siparisAdetLabel: UILabel!
    @IBOutlet weak var SepetYemekFiyatiLabel: UILabel!
    @IBOutlet weak var SepetYemekismiLabel: UILabel!
    @IBOutlet weak var Sepetİmage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
