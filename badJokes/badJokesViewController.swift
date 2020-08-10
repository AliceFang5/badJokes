//
//  badJokesViewController.swift
//  badJokes
//
//  Created by 方芸萱 on 2020/8/7.
//

import UIKit

class badJokesViewController: UIViewController {

    var jokes = [
        Joke(question: "哪一個沒有領到酬勞", guess1: "蝴蝶", guess2: "螞蟻", guess3: "蜈蚣", answer: 3, reason: "無功（蜈蚣）不受祿"),
        Joke(question: "哪一朵花最沒力", guess1: "茉莉花", guess2: "太陽花", guess3: "玫瑰花", answer: 1, reason: "好一朵美麗（沒力）的茉莉花"),
        Joke(question: "誰玩遊戲一定會被淘汰", guess1: "獅子", guess2: "狼", guess3: "老虎", answer: 2, reason: "桃太郎（淘汰狼）"),
        Joke(question: "哪一種人最愛搞怪", guess1: "日本人", guess2: "非洲人", guess3: "美國人", answer: 2, reason: "非洲人呼嘎蝦嘎（胡搞瞎搞）"),
        Joke(question: "哪一隻熊比較厲害", guess1: "灰熊", guess2: "黑熊", guess3: "白熊", answer: 1, reason: "非常（灰熊）厲害"),
        Joke(question: "鉛筆姓什麼", guess1: "林", guess2: "陳", guess3: "蕭", answer: 3, reason: "削（蕭）鉛筆")
    ]
    var questionCount = 1
    let questionCountMax = 3
    var correctCount = 0
    var answer = 0
    
    @IBOutlet weak var questionCountLabel: UILabel!
    @IBOutlet var jokeLabel: [UILabel]!
    @IBOutlet var guessButton: [UIButton]!
    
    @IBOutlet weak var supplyGuessButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var resultButton: UIButton!
    
    func showQuestion(){
        questionCountLabel.text = "Question NO.\(questionCount)"
        jokeLabel[0].text = jokes[0].question
        jokeLabel[1].text = jokes[0].guess1
        jokeLabel[2].text = jokes[0].guess2
        jokeLabel[3].text = jokes[0].guess3
        for i in 0...2 {
            guessButton[i].backgroundColor = UIColor.clear
        }
    }
    func checkAnswer(){
        //show reason
        jokeLabel[0].text = "因為：\(jokes[0].reason)"
        //check answer
        if answer == jokes[0].answer {
            correctCount += 1
            guessButton[answer-1].backgroundColor = UIColor.green
        }else{
            guessButton[jokes[0].answer-1].backgroundColor = UIColor.green
            guessButton[answer-1].backgroundColor = UIColor.red
        }
    }
    func guessButtonPressed(_ index: Int){
        for i in 0...2 {
            guessButton[i].backgroundColor = UIColor.clear
        }
        guessButton[index-1].backgroundColor = UIColor.yellow
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        jokes.shuffle()
        showQuestion()
        nextButton.isHidden = true
        resultButton.isHidden = true
        supplyGuessButton.isHidden = false
  }
 
    
    
    @IBAction func pressGuessButtons(_ sender: UIButton) {
        //回答期間(supplyGuessButton.isHidden == false)，guessButton才能被press
        if !supplyGuessButton.isHidden{
            answer = sender.tag
            guessButtonPressed(answer)
        }
    }
    
    @IBAction func pressCheckGuessButton(_ sender: UIButton) {
        if answer != 0 {
            checkAnswer()
            nextButton.isHidden = false
            supplyGuessButton.isHidden = true
            
            questionCount += 1
            if(questionCount > questionCountMax){
                //game over, show result, passing correctCount
                nextButton.isHidden = true
                resultButton.isHidden = false
            }
        }
    }
    @IBAction func pressNextButton(_ sender: UIButton) {
        answer = 0
        jokes.remove(at: 0)
        showQuestion()
        nextButton.isHidden = true
        supplyGuessButton.isHidden = false
    }

    @IBSegueAction func showResultSegue(_ coder: NSCoder) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.correctCount = correctCount
        return controller
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
