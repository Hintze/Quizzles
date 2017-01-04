//
//  QuizExam.swift
//  Quizzles
//
//  Created by Filip Hintze on 2017-01-04.
//  Copyright © 2017 Filip Hintze. All rights reserved.
//

import UIKit

class QuizExam {
    var correctAnswers: Int
    var wrongAnswers: Int
    
    init?(correctAnswers: Int, wrongAnswers: Int){
        
        self.correctAnswers = correctAnswers
        self.wrongAnswers = wrongAnswers
    }
}
