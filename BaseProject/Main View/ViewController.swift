//
//  ViewController.swift
//  BaseProject
//
//  Created by David Galán on 29/10/2018.
//  Copyright © 2018 David Galán. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: OBJECTS
    
    
    
    // MARK: VIEW METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        populateTexts()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        sleep(1)
        
        self.performSegue(withIdentifier: "goToMain", sender: nil)
    }
    
    // MARK: OTHER METHODS
    private func populateTexts() {
        
    }
    
    


}

