//
//  MarvelListTableViewCell.swift
//  MarvelProject
//
//  Created by Ruben Higuera on 8/3/22.
//

import UIKit

class MarvelListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var charImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(url: String, name: String?){
        guard let name = name else {return}
        nameLabel.text = name
        charImage.setImage(url: url)
    }
}

