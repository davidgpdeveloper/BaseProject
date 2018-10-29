//
//  ImageTools.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setRoundImage() {
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
    
}
