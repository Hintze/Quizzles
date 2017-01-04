//
//  Quiz.swift
//  Quizzles
//
//  Created by Filip Hintze on 2016-12-28.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import UIKit
import os.log

class Quiz: NSObject, NSCoding {
    
    //MARK: Properties
    var name: String
    var quizType: String
    var subject: String
    var identifier: Int
    var questions = [Question]()
    
    //MARK: Properties
    struct PropertyKey{
        static let name = "name"
        static let quizType = "quizType"
        static let subject = "subject"
        static let questions = "questions"
        static let identifier = "identifier"
    }
    
    //MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Quizzes")
    
    
    //MARK: Initialization
    init?(name: String, quizType: String, subject: String, identifier: Int){
        
        if(name.isEmpty || quizType.isEmpty || subject.isEmpty){
            return nil
        }
        
        self.name = name
        self.quizType = quizType
        self.subject = subject
        self.identifier = identifier
    }
    
    //MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(quizType, forKey: PropertyKey.quizType)
        aCoder.encode(subject, forKey: PropertyKey.subject)
        aCoder.encode(questions, forKey: PropertyKey.questions)
        aCoder.encode(identifier, forKey: PropertyKey.identifier)
        NSLog(String(identifier))
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String
            else{
                 os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
                return nil
        }
        let quizType = aDecoder.decodeObject(forKey: PropertyKey.quizType) as? String
        let subject = aDecoder.decodeObject(forKey: PropertyKey.subject) as? String
        let questions = aDecoder.decodeObject(forKey: PropertyKey.questions) as? [Question]
        let identifier = aDecoder.decodeInteger(forKey: PropertyKey.identifier)
        
        NSLog(String(describing: identifier))
        self.init(name: name, quizType: quizType!, subject: subject!, identifier: identifier)
        self.questions = questions!
    }
}
