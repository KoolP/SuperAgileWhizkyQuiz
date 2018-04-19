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
    
    var scoreCounter : Int!
    var questionCounter : Int!
    var quizModel : QuizModel!
    var theQuestion = [String:String]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        //#warning load new question here
        loadNewGame()
    }
    
    func loadNewGame() {
        quizModel = QuizModel()
        scoreCounter = 0
        questionCounter = 0
        showButtons()
        rightOrWrongLabel.text = ""
        loadNewQuestionAndAnswers()
    }
    
    @IBAction func newQuestionButton(_ sender: UIButton) {
        loadNewQuestionAndAnswers()
        rightOrWrongLabel.text = ""
    }
    
    func loadNewQuestionAndAnswers() {
        //put in QuizModels randomizer with existing game
        showQuestion()
        showButtons()
    }
    
    func showQuestion() {
        theQuestion = quizModel.getQuestion()
        questionLabel.text = theQuestion["Question"]
        firstChoice.titleLabel?.text = theQuestion["Answer01"]
        secondChoice.titleLabel?.text = theQuestion["Answer02"]
        thirdChoice.titleLabel?.text = theQuestion["Answer03"]
        fourthChoice.titleLabel?.text = theQuestion["Answer04"]
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        loadNewGame()
    }
    
    
    @IBAction func answerPressed(_ sender: Any) {
        makeGuess(sender as! UIButton)
    }
    
    func makeGuess(_ sender : UIButton) {
        var isCorrect : Bool
        questionCounter = questionCounter + 1
        
        let theGuess = sender.titleLabel?.text
        isCorrect = quizModel.isCorrectGuess(guess: theGuess!, question: theQuestion)
        
        if isCorrect {
            rightOrWrongLabel.text = "WÖ, rätt!!!!"
            addScoreCount()
        } else {
            rightOrWrongLabel.text = "Nope"
        }
        
        disableAnswerButtons()
        
        if questionCounter > 4 {
            scoreLabel.text = "Du har \(scoreCounter) poäng av \(questionCounter) frågor. Kul för dig."
        }
        
        if questionCounter == 10 {
            hideButtons()
        }
        
    }
    
    func addScoreCount() {
        if scoreCounter < 10 {
            scoreCounter = scoreCounter + 1
        } else {
            hideButtons()
        }
    }
    
    //#warning hide and disable buttons
    func hideButtons() {
        hideAnswerButtons()
        disableAnswerButtons()
    }
    
    //#warning show and enable buttons
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
    
    //disable answer buttons
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
        // Dispose of any resources that can be recreated.
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
