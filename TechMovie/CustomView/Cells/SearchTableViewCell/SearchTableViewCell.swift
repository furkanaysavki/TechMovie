//
//  SearchTableViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 1.01.2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    func configure(with model: Title) {
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model.poster_path ?? "")") else {
                    return
                }
       movieImage.sd_setImage(with: url)
       movieName.text = model.original_title
    }
    
}
