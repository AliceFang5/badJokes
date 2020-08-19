//
//  ResultViewController.swift
//  badJokes
//
//  Created by 方芸萱 on 2020/8/10.
//

import UIKit

class ResultViewController: UIViewController {

    var correctCount: Int!

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var awardLabel: UILabel!
    @IBOutlet weak var resultImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //init result with bad score
        var awardText = "嗚...我們真的不懂博士"
        var image = "步美傷心"
        //high score
        if correctCount >= 2{
            awardText = "Wow～不愧是少年偵探團！！"
            image = "步美開心"
        }
    
        //show result
        resultImage.image = UIImage(named: image)
        scoreLabel.text = String(correctCount*30)+"分"
        awardLabel.text = awardText
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("result prepare")
        if segue.identifier == "playSegue"{
            print("Play Segue")
//            if let controller = segue.destination as? badJokesViewController{
//                controller.correctCount = 5
//                print("controller.correctCount = 5")
//            }
        }else if segue.identifier == "addSegue"{
            print("Add Segue")
//            if let controller = segue.destination as? addBadJokeViewController{
//                controller.joke = Joke(question: "qoo", guess1: "g1", guess2: "g2", guess3: "g3", answer: 3, reason: "what?!")
//            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
