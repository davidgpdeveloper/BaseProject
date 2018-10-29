//
//  MenuViewController.swift
//  InteractiveSlideoutMenu
//
//  Created by Robert Chen on 2/7/16.
//
//  Copyright (c) 2016 Thorn Technologies LLC

//import UIKit
//
//class MenuViewController : UIViewController {
//    
//    // VARIABLES && CONSTANTS
//    var interactor: Interactor? = nil
//    var menuActionDelegate: MenuActionDelegate? = nil
//    let cellId = "cellId"
//    let emptyText = "empty"
//    
//    let menuItems = [
//        "empty",
////        setLanguage(key: "home_text"),
////        setLanguage(key: "transfers_text"),
////        setLanguage(key: "payment_text"),
////        setLanguage(key: "account_text"),
////        setLanguage(key: "fav_dest_text"),
////        setLanguage(key: "preferences_text"),
////        setLanguage(key: "messages_text"),
////        "empty",
////        setLanguage(key: "configuration_text"),
////        setLanguage(key: "help_text"),
////        "empty"
//    ]
//
//    let menuStoryboardViews = [
//        ["empty"],
//        ["Main", "MainViewController"],
//        ["MyTrips", "MyTripsVC"],
//        ["Payment", "PaymentVC"],
//        ["MyAccount", "MyAccountVC"],
//        ["FavoritePlaces", "FavoritePlacesVC"],
//        ["Preferences", "PreferencesVC"],
//        ["Messages", "MessagesVC"],
//        ["empty"],
//        ["Configuration", "ConfigurationVC"],
//        ["Help", "HelpVC"],
//        ["empty"]
//    ]
//    
//    // OBJECTS ///
//    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var imagePhotoProfile: UIImageView!
//    @IBOutlet weak var labelNameUser: UILabel!
//    
//    // DID LOAD ///
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        imagePhotoProfile.setRoundImage()
//    }
//    
//    
//    @IBAction func handleGesture(_ sender: UIPanGestureRecognizer) {
//        let translation = sender.translation(in: view)
//
//        let progress = MenuHelper.calculateProgress(translation, viewBounds: view.bounds, direction: .left)
//        
//        MenuHelper.mapGestureStateToInteractor(
//            sender.state,
//            progress: progress,
//            interactor: interactor){
//                self.dismiss(animated: true, completion: nil)
//        }
//    }
//    
//    @IBAction func closeMenu(_ sender: AnyObject) {
//        dismiss(animated: true, completion: nil)
//    }
//    
////    func delay(seconds: Double, completion:@escaping ()->()) {
////        let popTime = DispatchTime.now() + Double(Int64( Double(NSEC_PER_SEC) * seconds )) / Double(NSEC_PER_SEC)
////        DispatchQueue.main.asyncAfter(deadline: popTime) {
////            completion()
////        }
////    }
//    
////    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
////        dismiss(animated: true){
////            self.delay(seconds: 0.5) {
////                self.menuActionDelegate?.reopenMenu()
////            }
////        }
////    }
//    
//}
//
//extension MenuViewController : UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return menuItems.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! MenuCell
//        
////        if menuItems[indexPath.row] == emptyText {
////            cell.labelOptionMenu.text = ""
////        } else {
////            cell.labelOptionMenu.text = menuItems[indexPath.row]
////
////            if menuStoryboardViews[indexPath.row][1] == "MessagesVC" {
////                cell.viewAlertCounter.isHidden = false
////            }
////        }
//        
//        return cell
//    }
//}
//
//extension MenuViewController : UITableViewDelegate {
//    
//    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
//
////        if menuStoryboardViews[indexPath.row][0] != emptyText {
////            let tempViewPosition = menuStoryboardViews[indexPath.row][0] + menuStoryboardViews[indexPath.row][1]
////
////            if tempViewPosition != viewPosition {
////                viewPosition = tempViewPosition
////                menuActionDelegate?.goToNewView(storyboardName: menuStoryboardViews[indexPath.row][0], viewIdentifier: menuStoryboardViews[indexPath.row][1])
////            } else {
////                menuActionDelegate?.hideMenu()
////            }
////        }
//    }
//
//
//}

