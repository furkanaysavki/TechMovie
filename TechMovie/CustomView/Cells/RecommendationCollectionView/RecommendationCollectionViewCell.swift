//
//  RecommendationCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 30.12.2022.
//

import UIKit

class RecommendationCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recommendationView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configure(with model: Title) {
        
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "")") else {
            return
        }
        recommendationView.sd_setImage(with: url)
    }
}
