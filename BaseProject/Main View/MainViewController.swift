//
//  MainViewController.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

class MainViewController: MenuCustomVC {
    
    // OBJECTS ///
    @IBOutlet weak var buttonMenu: UIButton!
    @IBAction func buttonMenuAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: openMenuId, sender: nil)
    }
    @IBOutlet weak var buttonWhereGo: UIButton!
    @IBAction func buttonWhereGoAction(_ sender: UIButton) {actionButtonWhereGo()}
    @IBOutlet weak var buttonFav: UIButton!
    @IBAction func buttonFavAction(_ sender: UIButton) {actionButtonFav()}
    @IBOutlet weak var viewContainerButtons: UIView! {
        didSet {
            viewContainerButtons.layer.borderWidth = 1.0
            viewContainerButtons.layer.borderColor = #colorLiteral(red: 0.5999459624, green: 0.6000347733, blue: 0.5999264717, alpha: 1)
        }
    }
    
    // DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()
//        setAttributesMenuButton(button: buttonMenu)
    }
    
    
    // WILL APPEAR ///
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        buttonWhereGo.setTitle(setLanguage(key: "where_go_text"), for: UIControl.State())
    }
    
    
    // ACTION BUTTONS ///
    private func actionButtonFav() {
//        self.openPopupView(storyBoardName: "Main", viewIdentifier: "FavDestinationsVC", alphaComponent: 0.6)
    }
    
    private func actionButtonWhereGo() {
//        self.openPopupView(storyBoardName: "InsertAddress", viewIdentifier: "InsertAddressVC", alphaComponent: 0.6)
    }
}

