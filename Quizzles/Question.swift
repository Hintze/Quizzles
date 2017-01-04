//
//  Question.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-28.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit
import os.log

class Question: NSObject, NSCoding{
    var questionText: String
    //Holds 1-3 answers, number 1 (index 0) always holds the correct answer.
    var answers = [String]()
    
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("questions")
    
    //MARK: Types
    struct PropertyKey{
        static let questionText = "questionText"
        static let answers = "answers"
    }
   
    //MARK: Init
    init?(questionText: String, answers: [String]) {
        if(questionText.isEmpty || answers.count == 0){
            return nil
        }
        self.questionText = questionText
        self.answers = answers
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(questionText, forKey: PropertyKey.questionText)
        aCoder.encode(answers, forKey: PropertyKey.answers)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let questionText = aDecoder.decodeObject(forKey: PropertyKey.questionText) as? String
        let answers = aDecoder.decodeObject(forKey: PropertyKey.answers) as? [String]
        
        self.init(questionText: questionText!, answers: answers!)
    }
}


