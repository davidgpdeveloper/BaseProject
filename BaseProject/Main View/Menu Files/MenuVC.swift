//
//  MenuVC.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

class MenuVC: UIViewController {
    
    // MARK: OBJECTS
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: VARIABLES && CONSTANTS
    var interactor: Interactor? = nil
    var menuActionDelegate: MenuActionDelegate? = nil
    let cellId = "cellId"
    let emptyText = "empty"
    
    let menuItems = [
        "empty",
        "option 1",
        "empty",
        "option 2",
        "option 3",
        //        setLanguage(key: "home_text"),
    ]
    
    let menuStoryboardViews = [
        ["empty"],
//        ["Main", "MainViewController"],
    ]


    // MARK: VIEW METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        
        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .left)
        
        MenuHelper.mapGestureStateToInteractor(
            sender.state,
            progress: progress,
            interactor: interactor){
                self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func closeMenu(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    //    func delay(seconds: Double, completion:@escaping ()->()) {
    //        let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
    //        DispatchQueue.main.asyncAfter(deadline: popTime) {
    //            completion()
    //        }
    //    }
    
    //    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
    //        dismiss(animated: true){
    //            self.delay(seconds: 0.5) {
    //                self.menuActionDelegate?.reopenMenu()
    //            }
    //        }
    //    }
    
}

extension MenuVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuCell

            if menuItems[indexPath.row] == emptyText {
                cell.labelOptionMenu.text = ""
            } else {
                cell.labelOptionMenu.text = menuItems[indexPath.row]
            }
        
        return cell
    }
}

extension MenuVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        
        //        if menuStoryboardViews[indexPath.row][0] != emptyText {
        //            let tempViewPosition = menuStoryboardViews[indexPath.row][0] + menuStoryboardViews[indexPath.row][1]
        //
        //            if tempViewPosition != viewPosition {
        //                viewPosition = tempViewPosition
        //                menuActionDelegate?.goToNewView(storyboardName: menuStoryboardViews[indexPath.row][0], viewIdentifier: menuStoryboardViews[indexPath.row][1])
        //            } else {
        //                menuActionDelegate?.hideMenu()
        //            }
        //        }
    }
    
    
}

