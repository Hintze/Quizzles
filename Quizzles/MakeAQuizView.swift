//
//  MakeAQuizView.swift
//  Quizzles
//
//  Created by dipt on 2016-12-09.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class MakeAQuizView: UIViewController {
    
    @IBOutlet weak var QuizeTypeTextBox: UITextField!
    
    @IBOutlet weak var QuizTypePicker: UIPickerView!
    
    var list = ["Study","Exam"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponentsInPickerView(QuizTypePicker: UIPickerView) -> Int
    {
        return 1
    }
    
    func QuizTypePicker(QuizTypePicker: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
         return list.count
    
    }
    
    
    func QuizTypePicker(QuizTypePicker: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
    
        self.view.endEditing(true)
        return list[row]
    
    }
    
    func QuizTypePicker(QuizTypePicker: UIPickerView, didSelectRow row: Int, forComponent component: Int) {
        
        self.QuizeTypeTextBox.text = self.list[row]
        self.QuizTypePicker.isHidden = true
    
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
     
        if textField == self.QuizeTypeTextBox  {
            self.QuizTypePicker.isHidden = false
            
            textField.endEditing(true)
        }
    
    }
    
    
}

class MakeAQuizView2: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class MakeAQuizView3: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
