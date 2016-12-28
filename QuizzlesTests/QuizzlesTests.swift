//
//  QuizzlesTests.swift
//  QuizzlesTests
//
//  Created by Filip Hintze on 2016-12-06.
//  Copyright © 2016 Filip Hintze. All rights reserved.
//

import XCTest
@testable import Quizzles

class QuizzlesTests: XCTestCase {
    
    //MARK: Quiz class tests
    func testQuizInitSucceds(){
        let noNameQuiz = Quiz.init(name: "test", quizType: "exam", subject: "math")
        XCTAssertNotNil(noNameQuiz)
    }
    
}
