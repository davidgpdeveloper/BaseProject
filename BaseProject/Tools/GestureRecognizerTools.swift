//
//  GestureRecognizerTools.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

// hide keyboard when user touches outside keyboard
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// set tap gesture recognizer for images
func setTapGestureRecognizer(object: UIImageView, tapGesture: UITapGestureRecognizer) {
    object.isUserInteractionEnabled = true
    object.addGestureRecognizer(tapGesture)
}

// set tap gesture recognizer for labels
func setTapGestureRecognizer(object: UILabel, tapGesture: UITapGestureRecognizer) {
    object.isUserInteractionEnabled = true
    object.addGestureRecognizer(tapGesture)
}

// set tap gesture recognizer for view
func setTapGestureRecognizer(object: UIView, tapGesture: UITapGestureRecognizer) {
    object.isUserInteractionEnabled = true
    object.addGestureRecognizer(tapGesture)
}

// set tap gesture recognizer for textView
func setTapGestureRecognizer(object: UITextView, tapGesture: UITapGestureRecognizer) {
    object.isUserInteractionEnabled = true
    object.addGestureRecognizer(tapGesture)
}



