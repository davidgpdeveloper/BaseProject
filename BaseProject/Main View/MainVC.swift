//
//  MainVC.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

class MainVC: MenuActionsVC {
    
    // MARK: OBJECTS
    @IBOutlet weak var buttonMenu: UIButton!
    @IBAction func buttonMenuAction(_ sender: UIButton) {
        self.performSegue(withIdentifier: openMenuId, sender: nil)
    }
    
    // MARK: VIEW METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateTexts()
    }
    
    // MARK: OTHER METHODS
    private func populateTexts() {
        
    }
    
    
}

