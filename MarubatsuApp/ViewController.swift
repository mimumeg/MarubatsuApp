//
//  ViewController.swift
//  MarubatsuApp
//
//  Created by Megumi Mimura on 2018/10/27.
//  Copyright © 2018 三村恵. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    // 問題番号の格納
    var currentQuestionNum: Int = 0
    
    // 問題の格納 Anyはなんでも入る
    let questions: [[String: Any]] = [
        [
            "question":"iphoneアプリの開統合環境はZcodeである","answer":false
        ],
        [
            "question":"Xcode画面の右側にはユーティリティーズがある","answer":true
        ],
        [
            "question":"UILabelは文字列を表示する時に利用する","answer":true
        ]
    ]
    
    // 問題呼び出し
    func showQuestion(){
        
        let question = questions[currentQuestionNum]
        
        if let que = question["question"] as? String{
            questionLabel.text = que
        }
    }
    
    // 解答チェック yourAnswerは引数
    func checkAnswer(yourAnswer: Bool){
        
        let question = questions[currentQuestionNum]
        
        // 正解チェック
        if let ans = question["answer"] as? Bool{
            
            // 正解。問題番号を+1する
            if yourAnswer == ans{
                currentQuestionNum += 1
                
                showAlert(message: "正解")
                
            }else{
                // 不正解
                showAlert(message: "不正解")
                
                // 不正解でも次の問題に進む
                currentQuestionNum += 1
            }
        }
        
        // currentQuestionNumの値が問題数以上であれば最初の問題に戻す
        if currentQuestionNum >= questions.count{
            currentQuestionNum = 0
        }
        
        // 問題を表示
        // 正解ならば次の問題、不正解なら問題を再表示
        
        showQuestion()
    }
        
    func showAlert(message: String){
        
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
    // 起動時に１問目を表示
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
        
    }

    @IBAction func yesButton(_ sender: Any) {
        checkAnswer(yourAnswer: true)
    }
    
    @IBAction func noButton(_ sender: Any) {
        checkAnswer(yourAnswer: false)
    }
    
    // 正解数を表示する
    
}

