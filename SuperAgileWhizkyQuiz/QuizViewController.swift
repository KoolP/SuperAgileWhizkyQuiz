//
//  QuizViewController.swift
//  SuperAgileWhizkyQuiz
//
//  Created by Victoria Grönqvist on 2018-04-17.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var rightOrWrongLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var fourthChoice: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var nextQuestionButton: UIButton!
    
    var scoreCounter : Int = 0
    var questionCounter : Int = 0
    var hasGuessed : Bool = false
    var quizModel : QuizModel!
    var theQuestion = [String:String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstChoice.designButtons(button: firstChoice)
        secondChoice.designButtons(button: secondChoice)
        thirdChoice.designButtons(button: thirdChoice)
        fourthChoice.designButtons(button: fourthChoice)
        playAgainButton.designButtons(button: playAgainButton)
        questionLabel.designLabel2(label: questionLabel)
        nextQuestionButton.designButtons(button: nextQuestionButton)

        firstChoice.setColors(button: firstChoice)
        secondChoice.setColors(button: secondChoice)
        thirdChoice.setColors(button: thirdChoice)
        fourthChoice.setColors(button: fourthChoice)
        nextQuestionButton.setColors(button: nextQuestionButton)
        playAgainButton.setColors(button: playAgainButton)
        
        //rightOrWrongLabel.textColor = UIColor(red: 243.0/255.0, green: 193.0/255.0, blue: 49.0/255.0, alpha: 0.5)
       // scoreLabel.textColor = UIColor(red: 243.0/255.0, green: 193.0/255.0, blue: 49.0/255.0, alpha: 0.5)
        
        loadNewGame()
    }
    
    func loadNewGame() {
        print("Hello, I'm into loadNewGame :)))))")
        quizModel = QuizModel()
        scoreCounter = 0
        questionCounter = 0
        rightOrWrongLabel.text = ""
        scoreLabel.text = ""
        loadNewQuestionAndAnswers()
        print("ScoreCounter: \(scoreCounter), QuestionCounter: \(questionCounter)")
        scoreLabel.isHidden = false
        nextQuestionButton.isHidden = false
        
        
    }
    
    @IBAction func newQuestionButton(_ sender: UIButton) {
        
        loadNewQuestionAndAnswers()
        rightOrWrongLabel.text = ""
        questionCounter = questionCounter + 1
        print("QuestionCounter: \(questionCounter)")
        
        if questionCounter == 10 {
            hideButtons()
            
            nextQuestionButton.isHidden = true
            
            playAgainButton.setTitle("Play again?", for: .normal)
            
            self.view.bringSubview(toFront: playAgainButton)
            
            if scoreCounter < 3 {
                questionLabel.text = "U know nothing about whisky"
            } else if scoreCounter > 3 && scoreCounter < 6 {
                questionLabel.text = "U have basic knowledge about whisky"
            } else {
                questionLabel.text = "U are amazing!!!"
            }
        }

    }
    
    func loadNewQuestionAndAnswers() {
        hasGuessed = false
        showQuestion()
        showButtons()
    }
    
    func showQuestion() {
        theQuestion = quizModel.getQuestion()
        questionLabel.text = theQuestion["Question"]
        firstChoice.setTitle(theQuestion["Answer01"], for: .normal)
        secondChoice.setTitle(theQuestion["Answer02"], for: .normal)
        thirdChoice.setTitle(theQuestion["Answer03"], for: .normal)
        fourthChoice.setTitle(theQuestion["Answer04"], for: .normal)
        print("The question: \(theQuestion)")
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        print("Pressing play again button works just fine")
        loadNewGame()
    }
    
    
    @IBAction func answerPressed(_ sender: Any) {
        hasGuessed = true
        makeGuess(sender as! UIButton)
    }
    
    func makeGuess(_ sender : UIButton) {
        var isCorrect : Bool
        
        let theGuess = sender.titleLabel?.text
        isCorrect = quizModel.isCorrectGuess(guess: theGuess!, question: theQuestion)
        
        if isCorrect {
            rightOrWrongLabel.text = "Correct!!!"
            addScoreCount()
            print("ScoreCount: \(scoreCounter)")
        } else {
            rightOrWrongLabel.text = "Wrong"
        }
        
        disableAnswerButtons()
        
        if questionCounter > 0 {
            scoreLabel.text = "You have \(scoreCounter) out of 10"
        }
    }
    
    func addScoreCount() {
        if scoreCounter < 10 {
            scoreCounter = scoreCounter + 1
        }
    }
    
    //hide and disable buttons
    func hideButtons() {
        hideAnswerButtons()
        disableAnswerButtons()
    }
    
    //show and enable buttons
    func showButtons() {
        showAnswerButtons()
        enableAnswerbuttons()
    }
    
    //Hide buttons
    func hideAnswerButtons() {
        firstChoice.isHidden = true
        secondChoice.isHidden = true
        thirdChoice.isHidden = true
        fourthChoice.isHidden = true
        playAgainButton.isHidden = false
    }
    
    //Show buttons
    func showAnswerButtons() {
        firstChoice.isHidden = false
        secondChoice.isHidden = false
        thirdChoice.isHidden = false
        fourthChoice.isHidden = false
        playAgainButton.isHidden = true
    }
    
    //Disable answer buttons
    func disableAnswerButtons() {
        firstChoice.isEnabled = false
        secondChoice.isEnabled = false
        thirdChoice.isEnabled = false
        fourthChoice.isEnabled = false
        playAgainButton.isEnabled = true
    }
    
    //Enable answer buttons
    func enableAnswerbuttons() {
        firstChoice.isEnabled = true
        secondChoice.isEnabled = true
        thirdChoice.isEnabled = true
        fourthChoice.isEnabled = true
        playAgainButton.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
