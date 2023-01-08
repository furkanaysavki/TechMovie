//
//  OnBoardingCollectionViewCell.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 8.01.2023.
//

import UIKit

class OnBoardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnBoardingCollectionViewCell.self)
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(_ slide: OnboardingSlideModel) {
        titleLabel.text = slide.slideTitle
        slideImageView.image = slide.slideImage
        descriptionLabel.text = slide.slideDescription
    }
}
