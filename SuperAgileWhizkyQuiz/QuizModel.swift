//
//  QuizModel.swift
//  WhiskyQuiz
//
//  Created by Eric Groseclos on 2018-04-17.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation


class QuizModel {
    
    private var chosenQuestion: [[String:String]]!
    
    private var questionArray: [[[String:String]]]!
    
    init() {
        generateQuestions()
    }
    
    func isCorrectGuess(guess: String, question: [[String:String]]) -> Bool {
        
        var correctGuessed: Bool = false
        
        if guess == question[5]["Correct"] {
            correctGuessed = true
        } else {
            correctGuessed = false
        }
        
        return correctGuessed
    }
    
    func getQuestion() -> [[String:String]] {
        
        if (self.questionArray.count == 0) {
            generateQuestions()
        }
        
        let indexx: Int = Int(arc4random_uniform(UInt32(self.questionArray.count)))
        self.chosenQuestion = self.questionArray[indexx]
        
        self.questionArray.remove(at: indexx)
        
        return self.chosenQuestion
    }
    
    func generateQuestions() {
        
        let newQuestion = questions
        self.questionArray = [newQuestion]
        
    }
    
}
