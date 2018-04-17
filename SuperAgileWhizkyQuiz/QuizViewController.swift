//
//  QuizViewController.swift
//  SuperAgileWhizkyQuiz
//
//  Created by Victoria Grönqvist on 2018-04-17.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //#warning load new question here
        loadNewQuestion()
        
    }
    
    func loadNewQuestion() {
        
    }
    
    func makeGuess() {
        
    }
    
    //#warning hide and disable buttons
    func hideAnswer() {
        hideAnswerButtons()
        disableAnswerButtons()
        
    }
    
    //#warning show and enable buttons
    func showAnswer() {
        showAnswerButtons()
        enableAnswerbuttons()
    }
    
    //Hide buttons
    func hideAnswerButtons() {
        
    }
    
    //Show buttons
    func showAnswerButtons() {
        
    }
    
    //disable answer buttons
    func disableAnswerButtons() {
        
    }
    
    //Enable answer buttons
    func enableAnswerbuttons() {
        
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
