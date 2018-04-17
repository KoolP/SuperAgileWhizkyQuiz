//
//  QuizModel.swift
//  WhiskyQuiz
//
//  Created by Eric Groseclos on 2018-04-17.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation

class QuizModel {
    
    private var chosenQuestion: NSDictionary!
    
    private var questionArray: NSMutableArray!
    
    init() {
        generateQuestions()
    }
    
    func isCorrectGuess(guess: String, question: NSDictionary) -> Bool {
        
        var correctGuessed: Bool = false
        
        if guess == (question["correctAnswer"] as! String) {
            correctGuessed = true
        } else {
            correctGuessed = false
        }
        
        return correctGuessed
    }
    
    func getQuestion() -> NSDictionary {
        
        if ((self.chosenQuestion) != nil) {
            self.questionArray.remove(self.chosenQuestion)
        }
        
        if (self.questionArray.count == 0) {
            generateQuestions()
        }
        
        let indexx: Int = Int(arc4random_uniform(UInt32(self.questionArray.count)))
        
        self.chosenQuestion = self.questionArray[indexx] as! NSDictionary
        
        return self.chosenQuestion
    }
    
    func generateQuestions() {
        // Milja's questions
    }
    
}
