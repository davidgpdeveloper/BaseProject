//
//  NavigationViewTools.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

//// go to previous view
//func actionBarButtonGoBack(view: UIViewController) {
//    view.navigationController?.popViewController(animated: true)
//}
//
//// go to root view
//func actionBarButtonGoBackToRootView(view: UIViewController) {
//    view.navigationController?.popToRootViewController(animated: true)
//}

extension UIViewController {
    
    func actionButtonShowMenu() {
        if canPerformSegue(withIdentifier: segueMenuId) {
            self.performSegue(withIdentifier: segueMenuId, sender: nil)
        }
    }
    
    func openPopupView(storyBoardName: String, viewIdentifier: String, alphaComponent: CGFloat) {
        
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        
        let vc = storyboard.instantiateViewController(withIdentifier: viewIdentifier)
        
        vc.view.backgroundColor = UIColor.black.withAlphaComponent(alphaComponent)
        self.addChild(vc)
        self.view.addSubview(vc.view)
    }
    
    func openPopupView(viewController: UIViewController, alphaComponent: CGFloat) {
        viewController.view.backgroundColor = UIColor.black.withAlphaComponent(alphaComponent)
        self.addChild(viewController)
        self.view.addSubview(viewController.view)
    }
    
    func getNewViewController(storyBoardName: String, viewIdentifier: String) -> UIViewController {
        let storyboard = UIStoryboard(name: storyBoardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: viewIdentifier)
    }
    
    func closePopupView() {
        self.removeFromParent()
        self.view.removeFromSuperview()
    }
    
    
    
    /**
     Checks whether controller can perform specific segue or not.
     - parameter identifier: Identifier of UIStoryboardSegue.
     */
    func canPerformSegue(withIdentifier identifier: String) -> Bool {
        //first fetch segue templates set in storyboard.
        guard let identifiers = value(forKey: "storyboardSegueTemplates") as? [NSObject] else {
            //if cannot fetch, return false
            return false
        }
        //check every object in segue templates, if it has a value for key _identifier equals your identifier.
        let canPerform = identifiers.contains { (object) -> Bool in
            if let id = object.value(forKey: "_identifier") as? String {
                if id == identifier{
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
        }
        return canPerform
    }
}



