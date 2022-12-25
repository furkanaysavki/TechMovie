//
//  PopularCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 20.12.2022.
//

import UIKit

class PopularCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var popularImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with model: Title) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "")") else {
                    return
                }
        popularImageView.sd_setImage(with: url)
    }

}
