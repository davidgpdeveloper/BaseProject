//
//  AnimationsTools.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

// Basic animation for popup action.
extension UIViewController {
    
    func startBasicAnimation(viewMainContainer: UIView) {
        
        viewMainContainer.alpha = 0
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            viewMainContainer.alpha = 1
            
        }, completion: nil)
    }
    
    func endBasicAnimation(viewMainContainer: UIView) {
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            viewMainContainer.alpha = 0
            
        }, completion: { (finished: Bool) in
            self.closePopupView()
        })
    }
    
}

