//
//  Quiz.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-28.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit

class Quiz {
    //MARK: Properties
    
    var name: String
    var quizType: String
    var subject: String

    
    //MARK: Initialization
    init?(name: String, quizType: String, subject: String){
        
        if(name.isEmpty || quizType.isEmpty || subject.isEmpty){
            return nil
        }
        
        self.name = name
        self.quizType = quizType
        self.subject = subject
    }
    
}
