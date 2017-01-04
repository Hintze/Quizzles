//
//  QuizOverviewViewController.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-30.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class QuizOverviewViewController: UITableViewController{
    
    var questions = [Question]()
    var passedQuiz:Quiz?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = (passedQuiz?.questions)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func showQuizCode(_ sender: Any) {
        let alertController = UIAlertController(title: "QuizCode", message: passedQuiz?.identifier.description, preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "QuestionTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? QuestionTableViewCell else {
            fatalError("The dequed cell is not an instance of questionTableviewcell")
        }
        let question = questions[indexPath.row]
        
        cell.correctAnswer.text = question.answers[0]
        cell.wrongAnswer1.text = question.answers[1]
        cell.wrongAnswer2.text = question.answers[2]
        cell.questionText.text = question.questionText
        
        return cell
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
