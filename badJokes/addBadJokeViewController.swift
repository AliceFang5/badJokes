//
//  addBadJokeViewController.swift
//  badJokes
//
//  Created by 方芸萱 on 2020/8/17.
//

import UIKit

class addBadJokeViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet var badJokeLabel: [UITextField]!
    
    var joke : Joke!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playButton.isHidden = true
        
        joke = Joke(question: "John的媽媽是誰", guess1: "海", guess2: "湖", guess3: "花", answer: 3, reason: "花生醬（John）")
        
        // Do any additional setup after loading the view.
    }

    func checkEdit(){
        playButton.isHidden = true
        for i in 0...5 {
            guard badJokeLabel[i].text != "" else {
                //alert
                print("Edit \(i) nil")
                return
            }
        }
        print("EditAction done")
        playButton.isHidden = false

        joke = Joke(question: badJokeLabel[0].text!, guess1: badJokeLabel[1].text!, guess2: badJokeLabel[2].text!, guess3: badJokeLabel[3].text!, answer: Int(badJokeLabel[4].text!) ?? 1, reason: badJokeLabel[5].text!)
        print(joke!)
    }

    @IBAction func edit(_ sender: UITextField) {
        checkEdit()
    }
    
    @IBAction func edit0(_ sender: UITextField) {
    }
    @IBAction func edit1(_ sender: UITextField) {
    }
    @IBAction func edit2(_ sender: UITextField) {
    }
    @IBAction func edit3(_ sender: UITextField) {
    }
    @IBAction func edit4(_ sender: UITextField) {
    }
    @IBAction func edit5(_ sender: UITextField) {
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let controller = segue.destination as? badJokesViewController{
            controller.jokesLib.append(joke)
            print("Add new joke")
        }
        return
     }
}
