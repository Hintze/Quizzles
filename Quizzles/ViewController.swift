//
//  RootViewController.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-06.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func MakeAQuizButton(sender: UIButton) {
        self.performSegue(withIdentifier: "MakeAQuizView", sender: self)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

