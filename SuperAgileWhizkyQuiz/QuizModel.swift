//
//  QuizModel.swift
//  WhiskyQuiz
//
//  Created by Eric Groseclos on 2018-04-17.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation


class QuizModel {
    
    private var chosenQuestion: Dictionary<String,String>!
    
    private var questionArray: Array<Dictionary<String,String>>!
    
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
    
    func getQuestion() -> Dictionary<String,String> {
        
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
