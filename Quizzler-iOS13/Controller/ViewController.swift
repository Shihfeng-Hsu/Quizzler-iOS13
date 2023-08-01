//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

var timer = Timer()

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scroeLabel: UILabel!
    
    @IBOutlet weak var topButton: UIButton!
    @IBOutlet weak var middleButton: UIButton!
    @IBOutlet weak var bottomButton: UIButton!
    
    var quizBrain = QuizBrain()

    
   
    var progressRate = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateQuestion()
        

    }

    @IBAction func anserButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let isRight = quizBrain.checkAnswer(userAnswer)
        
        if isRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateQuestion), userInfo: nil, repeats: false)
       

 
    }
    
    @objc func updateQuestion(){
 
        questionLabel.text = quizBrain.getQuiz().text
        let quizButtonText = quizBrain.getQuiz().answer
        topButton.setTitle(quizButtonText[0], for: .normal)
        middleButton.setTitle(quizButtonText[1], for: .normal)
        bottomButton.setTitle(quizButtonText[2], for: .normal)
        
        topButton.backgroundColor = UIColor.clear
        middleButton.backgroundColor = UIColor.clear
        bottomButton.backgroundColor = UIColor.clear
///Animation ver.
//        progressRate = Double(quizNumber+1)/Double(quiz.count)
//        progressBar.setProgress(Float(progressRate), animated: true)
///Animation ver.
        
        progressBar.progress = quizBrain.getProgress()
        scroeLabel.text = "Score: \(quizBrain.score)"
    }
    
}

