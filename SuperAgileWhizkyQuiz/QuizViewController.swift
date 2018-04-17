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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreCounter = 0

        //#warning load new question here
        loadNewGame()
        
    }
    
    
    @IBAction func newQuestionButton(_ sender: UIButton) {
        loadNewQuestionAndAnswers()
    }
    
    func loadNewQuestionAndAnswers() {
        //put in QuizModels randomizer with existing game
        showButtons()
    }
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        loadNewGame()
    }
    
    func loadNewGame() {
        //put in QuizModels randomizer on all questions
        showButtons()
    }
    
    func makeGuess() {
        
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
