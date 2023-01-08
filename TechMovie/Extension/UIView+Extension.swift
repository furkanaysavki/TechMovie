//
//  UIView+Extension.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 8.01.2023.
//

import Foundation
import UIKit

extension UIView {
   @IBInspectable var cornerRadius: CGFloat {
       get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
