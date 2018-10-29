//
//  AlertTools.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // Alert for show some information
    func showInfoAlert(title: String, message: String, buttonOneText: String, style: UIAlertController.Style) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let buttonOne = UIAlertAction(title: buttonOneText, style: .default)
        alert.addAction(buttonOne)
        
        self.present(alert, animated: true)
    }
    
    // Alert with completionHandler to control actions, with optional one or two buttons
    func showAlert(title: String = "", message: String, style: UIAlertController.Style, twoButtons: Bool = false, buttonOneText: String, buttonTwoText: String = "", completion: @escaping (Bool) -> ()) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        
        let buttonOne = UIAlertAction(title: buttonOneText, style: .default) {
            UIAlertAction in
            completion(true)
        }
        alert.addAction(buttonOne)
        
        if twoButtons {
            let buttonTwo = UIAlertAction(title: buttonTwoText, style: .default) {
                UIAlertAction in
                completion(false)
            }
            alert.addAction(buttonTwo)
        }
        
        self.present(alert, animated: true)
    }
    
}



