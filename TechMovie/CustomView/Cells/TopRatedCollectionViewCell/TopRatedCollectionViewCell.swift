//
//  TopRatedCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 20.12.2022.
//

import UIKit

class TopRatedCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var topratedImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with model: Title) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "")") else {
                    return
                }
       topratedImageView.sd_setImage(with: url)
    }
}
