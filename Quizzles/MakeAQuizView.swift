//
//  MakeAQuizView.swift
//  Quizzles
//
//  Created by dipt on 2016-12-09.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class MakeAQuizView: UIViewController {
    
    @IBOutlet weak var quizeTypeTextBox: UITextField!
    @IBOutlet weak var quizCategory: UITextField!
    @IBOutlet weak var quizName: UITextField!
    @IBOutlet weak var quizTypePicker: UIPickerView!
    
    var list = ["Study","Exam"]
    
    var newQuiz:Quiz?
    
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
        
        self.quizeTypeTextBox.text = self.list[row]
        self.quizTypePicker.isHidden = true
    
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
     
        if textField == self.quizeTypeTextBox  {
            self.quizTypePicker.isHidden = false
            
            textField.endEditing(true)
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Continue"){
            var svc = segue.destination as! MakeAQuestionViewController
            svc.toPass = newQuiz
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier == "Continue"){
            newQuiz = Quiz(name: quizName.text!, quizType: quizeTypeTextBox.text!, subject: quizCategory.text!, identifier: -1)
        }
        
        if(newQuiz != nil){
            return true
        }else{
            return false
        }
    }
}
