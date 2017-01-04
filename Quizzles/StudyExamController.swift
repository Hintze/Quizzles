//
//  StudyExamController.swift
//  Quizzles
//
//  Created by dipt on 2016-12-13.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit


class StudyExamView: UIViewController {
    
    @IBOutlet weak var questionText: UITextView!
    var quiz: Quiz?
    
    @IBOutlet weak var textAnswer: UITextField!
    @IBOutlet weak var multiAnswer1: UIButton!
    @IBOutlet weak var multiAnswer2: UIButton!
    @IBOutlet weak var multiAnswer3: UIButton!
    @IBOutlet weak var submitButton: UIButton!
    
    var quizSession: QuizExam?
    var answeredQuiz: Bool = false
    var currentQuestion: Int = 0
    var correctAnswer: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.becomeFirstResponder()
        if(currentQuestion == 0){
            quizSession = QuizExam(correctAnswers: 0, wrongAnswers: 0)
        }
        correctAnswer = quiz?.questions[currentQuestion].answers[0]
        
        questionText.text = quiz?.questions[currentQuestion].questionText
               
        if(quiz?.questions[currentQuestion].answers[1] != ""){
            textAnswer.isHidden = true
            submitButton.isHidden = true
            multiAnswer1.isHidden = false
            multiAnswer2.isHidden = false
            multiAnswer3.isHidden = false
            
            var answerArray = quiz?.questions[currentQuestion].answers
            
            var randomOrder = Int(arc4random_uniform(UInt32((answerArray?.count)!)))
            multiAnswer1.setTitle(answerArray?[randomOrder], for: .normal)
            answerArray?.remove(at: randomOrder)
            randomOrder = Int(arc4random_uniform(UInt32((answerArray?.count)!)))
            multiAnswer2.setTitle(answerArray?[randomOrder], for: .normal)
            answerArray?.remove(at: randomOrder)
            randomOrder = Int(arc4random_uniform(UInt32((answerArray?.count)!)))
            multiAnswer3.setTitle(answerArray?[randomOrder], for: .normal)
            answerArray?.remove(at: randomOrder)
            
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sumbitAnswer(_ sender: Any) {
        if(textAnswer.text == correctAnswer){
            submitButton.backgroundColor = UIColor.green
            quizSession?.correctAnswers += 1
        }
        else{
            submitButton.backgroundColor = UIColor.red
            quizSession?.wrongAnswers += 1
        }
        answeredQuiz = true
    }
        @IBAction func pressedFirstButton(_ sender: Any) {
        if((sender as? UIButton)?.titleLabel?.text == correctAnswer && answeredQuiz == false){
            (sender as? UIButton)?.backgroundColor = UIColor.green
            quizSession?.correctAnswers += 1
        }else if(answeredQuiz == false){
            (sender as? UIButton)?.backgroundColor = UIColor.red
            quizSession?.wrongAnswers += 1
        }
        answeredQuiz = true
    }
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if(event?.subtype == UIEventSubtype.motionShake){
            performSegue(withIdentifier: "nextQuestion", sender: nil)          }
   }
    @IBAction func pressedSecondButton(_ sender: Any) {
        if((sender as? UIButton)?.titleLabel?.text == correctAnswer && answeredQuiz == false){
            (sender as? UIButton)?.backgroundColor = UIColor.green
            quizSession?.correctAnswers += 1
        }else if(answeredQuiz == false){
            (sender as? UIButton)?.backgroundColor = UIColor.red
            quizSession?.wrongAnswers += 1
        }
        answeredQuiz = true
    }
    @IBAction func pressedThirdButton(_ sender: Any) {
        if((sender as? UIButton)?.titleLabel?.text == correctAnswer && answeredQuiz == false){
            (sender as? UIButton)?.backgroundColor = UIColor.green
            quizSession?.correctAnswers += 1
        }else if(answeredQuiz == false){
            (sender as? UIButton)?.backgroundColor = UIColor.red
            quizSession?.wrongAnswers += 1
        }
        answeredQuiz = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "nextQuestion"){
            let svc = segue.destination as! StudyExamView
            svc.quizSession = self.quizSession
            svc.quiz = self.quiz
            svc.currentQuestion = currentQuestion + 1
        }
        if (segue.identifier == "showResultView"){
            let svc = segue.destination as! ResultView
            svc.quiz = self.quiz
            svc.quizSession = self.quizSession
        }

    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier == "nextQuestion"){
            if(answeredQuiz == true){
                if(quiz?.questions.count != (currentQuestion + 1)){
                    return true
                } else{
                    performSegue(withIdentifier: "showResultView", sender: nil)
                }
            }
        }
        return false
    }
}


class EnterCodeView: UIViewController {
    
    @IBOutlet weak var code: UITextField!
    var quizToTake: Quiz?
    var quizzes = [Quiz]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.quizzes = (NSKeyedUnarchiver.unarchiveObject(withFile: Quiz.ArchiveURL.path) as? [Quiz] ?? [])
    }
    
    @IBAction func fetchQuiz(_ sender: Any) {
        for quiz in self.quizzes {
            if (code.text == quiz.identifier.description){
                self.quizToTake = quiz
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "startQuiz"){
            let svc = segue.destination as! StudyExamView
            svc.quiz = quizToTake
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if(identifier == "startQuiz"){
            if(quizToTake == nil){
                return false
            } else{
                return true
            }
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

class ResultView: UIViewController {
    
    @IBOutlet weak var navigationBar: UINavigationBar!
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var rightBar: UIView!
    @IBOutlet weak var wrongBar: UIView!
    var quizSession: QuizExam?
    var quiz: Quiz?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let correctAnswers = quizSession?.correctAnswers {
            rightLabel.text = String(correctAnswers)
        }
        if let wrongAnswers = quizSession?.wrongAnswers{
            wrongLabel.text = String(wrongAnswers)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
