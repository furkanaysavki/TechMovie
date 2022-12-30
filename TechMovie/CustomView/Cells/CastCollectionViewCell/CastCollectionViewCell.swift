//
//  CastCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 28.12.2022.
//

import UIKit
import SDWebImage

class CastCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var castImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with model: CastResults) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.profilePath ?? "" )") else {
                    return
                }
       
            self.castImageView.sd_setImage(with: url)
            self.nameLabel.text = model.name
        
       
       
    }
}
