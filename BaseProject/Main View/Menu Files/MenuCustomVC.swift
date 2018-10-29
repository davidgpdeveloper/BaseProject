//
//  MenuCustomVC.swift
//  trasladiaUser
//
//  Created by David Galán on 08/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

protocol MenuActionDelegate {
    func openSegue(_ segueName: String, sender: AnyObject?)
    func reopenMenu()
    func goToNewView(storyboardName: String, viewIdentifier: String)
    func hideMenu()
}

let openMenuId = "openMenu"

class MenuCustomVC: UIViewController {
    
    // VARIABLES && CONSTANTS ///
    let interactor = Interactor()
        
    
    // PAN GESTURE ///
    @IBAction func edgePanGesture(_ sender: UIScreenEdgePanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .right)
        
        MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
//                if canPerformSegue(withIdentifier: openMenuId) {
                    self.performSegue(withIdentifier: openMenuId, sender: nil)
//                }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let destinationViewController = segue.destination as? MenuViewController {
            destinationViewController.transitioningDelegate = self
            destinationViewController.interactor = interactor
            destinationViewController.menuActionDelegate = self /*as? MenuActionDelegate*/
        }
    }
}

extension MenuCustomVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentMenuAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissMenuAnimator()
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return interactor.hasStarted ? interactor : nil
    }
}


extension MenuCustomVC : MenuActionDelegate {
    
    func hideMenu() {
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
    
    func goToNewView(storyboardName: String, viewIdentifier: String) {
        print(">>> Go to: " + storyboardName + " > " + viewIdentifier)
        
        DispatchQueue.main.async {
            self.dismiss(animated: true) {
                let mainStoreboard: UIStoryboard  = UIStoryboard(name: storyboardName, bundle: nil)
                let DVC = mainStoreboard.instantiateViewController(withIdentifier: viewIdentifier)
                self.navigationController?.pushViewController(DVC, animated: true)
            }
        }
    }
    
    func openSegue(_ segueName: String, sender: AnyObject?) {
        dismiss(animated: true) {
//            if self.canPerformSegue(withIdentifier: segueName) {
                self.performSegue(withIdentifier: segueName, sender: sender)
//            }
        }
    }
    
    func reopenMenu() {
//        if canPerformSegue(withIdentifier: openMenuId) {
            performSegue(withIdentifier: openMenuId, sender: nil)
//        }
    }
}
