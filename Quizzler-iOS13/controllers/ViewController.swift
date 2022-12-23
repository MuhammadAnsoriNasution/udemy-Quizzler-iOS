//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var labelSqore: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    var quizBrain =  QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quizBrain.shuffleQuestion()
        updeteUi()
        labelSqore.text = "0"
        
    }

    @IBAction func answerButtonPress(_ sender: UIButton) {
        let answer = sender.currentTitle!
        let userGotitRight = quizBrain.checkAnswer(userAnswer: answer)
        if userGotitRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2 , target: self, selector: #selector(updeteUi), userInfo: nil, repeats: false)

    }
    
    @objc func updeteUi(){
        questionLabel.text = quizBrain.getQuestionText()
        answer1.backgroundColor = UIColor.clear
        answer2.backgroundColor = UIColor.clear
        answer3.backgroundColor = UIColor.clear
        answer1.setTitle(quizBrain.getAnswerLabels()[0], for: .normal)
        answer2.setTitle(quizBrain.getAnswerLabels()[1], for: .normal)
        answer3.setTitle(quizBrain.getAnswerLabels()[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        labelSqore.text = String(quizBrain.getScore())
    }

}

