//
//  TextFieldObservers.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

protocol TextFieldProtocol {
    func passObjectToMove(insets: UIEdgeInsets, variableInt: CGFloat)
}

class TextFieldObservers {
    
    private var delegateTextField: TextFieldProtocol?
    private var variableInt: CGFloat = 0
    
    func setVariables(delegate: TextFieldProtocol, variableInt: CGFloat = 0) {
        self.delegateTextField = delegate
        self.variableInt = variableInt
    }
    
    //step.1 Add observers for 'UIKeyboardWillShow' and 'UIKeyboardWillHide' notification.
    func addObserversMethod() {
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: nil) {
            notification in
            self.keyboardWillShow(notification: notification)
        }
        
        NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: nil) {
            notification in
            self.keyboardWillHide(notification: notification)
        }
    }

    //step.2 Add method to handle keyboardWillShow notification, we're using this method to adjust scrollview to show hidden textfield under keyboard.
    func keyboardWillShow(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let frame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
                return
        }
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: frame.height, right: 0)
        delegateTextField?.passObjectToMove(insets: contentInset, variableInt: self.variableInt)
    }
    
    //step.3 Method to reset scrollview when keyboard is hidden.
    func keyboardWillHide(notification: Notification) {
        delegateTextField?.passObjectToMove(insets: UIEdgeInsets.zero, variableInt: self.variableInt)
    }
    
    //step.4 Method to remove observers
    func removeObserversMethod() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}

