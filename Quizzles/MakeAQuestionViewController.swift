//
//  MakeAQuestionViewController.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-28.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class MakeAQuestionViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var questionfield: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionfield.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        questionfield.text = ""
        questionfield.textColor = UIColor.black
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
