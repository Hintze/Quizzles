//
//  MakeAQuestionViewController.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-28.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit
import os.log

class MakeAQuestionViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var answerStack: UIStackView!
    @IBOutlet weak var questionfield: UITextView!
    @IBOutlet weak var multiAnswer1: UITextField!
    @IBOutlet weak var answer: UITextField!
    @IBOutlet weak var multiAnswer2: UITextField!
    
    var toPass: Quiz!
    var quizzes = [Quiz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.quizzes = (NSKeyedUnarchiver.unarchiveObject(withFile: Quiz.ArchiveURL.path) as? [Quiz] ?? [])
        toPass.identifier = self.quizzes.count
        questionfield.delegate = self
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func MultiSwitchValueChange(_ sender: Any) {
        if ((sender as! UISwitch).isOn){
            UIView.animate(withDuration: 0.5, delay: 0.1, animations:{
                self.multiAnswer1.isHidden = false
                self.multiAnswer2.isHidden = false
            })
        }else{
            UIView.animate(withDuration: 0.5, delay: 0.1, animations:{
                self.multiAnswer1.isHidden = true
                self.multiAnswer2.isHidden = true
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView){
        questionfield.text = ""
        questionfield.textColor = UIColor.black
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier == "NewQuestion"){
            var answers = [String]()
            if(questionfield.text.isEmpty || answer.text! == "Answer" || (answer.text?.isEmpty)!){
                return false
            }else{
                
                for answer in answerStack.arrangedSubviews{
                    answers.append((answer as! UITextField).text!)
                }
            }
            let question = Question(questionText: questionfield.text, answers: answers)
            toPass.questions.append(question!)
            return true
        }
        return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "NewQuestion"){
            let quizPass = segue.destination as! MakeAQuestionViewController
            quizPass.toPass = self.toPass
        }
        else if(segue.identifier == "completeQuiz"){
            let newQuiz = segue.destination as! QuizOverviewViewController
            newQuiz.passedQuiz = self.toPass
        }
    }
    @IBAction func completeQuizButton(_ sender: Any) {
        quizzes.append(self.toPass)
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(quizzes, toFile: Quiz.ArchiveURL.path)
        
        if isSuccessfulSave {
            os_log("Quizzes successfully saved.", log: OSLog.default, type: .debug)
            performSegue(withIdentifier: "completeQuiz", sender: nil)
        } else {
            os_log("Failed to save meals...", log: OSLog.default, type: .error)
        }
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
