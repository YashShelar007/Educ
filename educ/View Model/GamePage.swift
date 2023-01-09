//
//  ViewController.swift
//  CSE335GroupProject
//
//  Created by NewUser on 11/30/22.
//

import UIKit
import GameKit

class GamePage: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var firstChoice: UIButton!
    @IBOutlet weak var secondChoice: UIButton!
    @IBOutlet weak var thirdChoice: UIButton!
    @IBOutlet weak var fourthChoice: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var correctOrIncorrect: UILabel!
    
    var myQuestions = [Questions]()
    var curr:Questions = Questions(qTitle: "Causing Extreme Distress", ans: ["chary","harrowing","semblance", "iconoclast"], ansPos: 1);
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true;
        loadQuest()
        showQ()
    }

    @IBAction func userInput(_ sender: UIButton) {
        firstChoice.isEnabled = false
        secondChoice.isEnabled = false
        thirdChoice.isEnabled = false
        fourthChoice.isEnabled = false
        
        let cAns = curr.getA()
        let selected = sender.titleLabel?.text
        correctOrIncorrect.isHidden = false;
        
        if(cAns == selected)
        {
            correctOrIncorrect.text = "YOU ARE CORRECT"
        }
        else
        {
            correctOrIncorrect.text = "YOU ARE INCORRECT \n THE ANSWER IS: \(cAns)"
        }
    }
    
    @IBAction func next(_ sender: Any) {
        firstChoice.isEnabled = true
        secondChoice.isEnabled = true
        thirdChoice.isEnabled = true
        fourthChoice.isEnabled = true
        showQ();
    }
    
    func loadQuest()
    {
        myQuestions.append(Questions(qTitle: "Causing Extreme Distress", ans: ["chary","harrowing","semblance", "iconoclast"], ansPos: 1))
        myQuestions.append(Questions(qTitle: "Difficult To Understand", ans: ["sultry","wry","frieze", "recondite"], ansPos: 3))
        myQuestions.append(Questions(qTitle: "Tastelessly Showy", ans: ["tawdry","credence","conceit", "acrimony"], ansPos: 0))
        myQuestions.append(Questions(qTitle: "Warn", ans: ["Get Closer","Feel Sleepy","Tell Of Danger", "Write"], ansPos: 2))
        myQuestions.append(Questions(qTitle: "Bold", ans: ["Strong","Made up","Brave", "Ancient"], ansPos: 2))
        myQuestions.append(Questions(qTitle: "Alleged", ans: ["Energetic","Supposed","Frightened", "Gathered"], ansPos: 1))
        myQuestions.append(Questions(qTitle: "Rival", ans: ["Website","Large Ship","Water Plant", "Competitor"], ansPos: 3))
        myQuestions.append(Questions(qTitle: "A Natural Talent", ans: ["Propriety","Flair","Knight", "Flourish"], ansPos: 1))
        myQuestions.append(Questions(qTitle: "Make Peace With", ans: ["Reconcile","Practitioner","Fortitude", "Testator"], ansPos: 0))
        myQuestions.append(Questions(qTitle: "A Person of noble birth trained to arms and chivalry", ans: ["importunate","loath","clad", "knight"], ansPos: 3))
        myQuestions.append(Questions(qTitle: "A Laborer who is obliged to do menial work", ans: ["peon","contract","equable", "gawk"], ansPos: 1))
        myQuestions.append(Questions(qTitle: "Complain", ans: ["eschew","gripe","wanton", "overweening"], ansPos: 1))
        myQuestions.append(Questions(qTitle: "Area relatively far from the center as of a city or town", ans: ["Outskirts","Refractory","Jibe", "Functionary"], ansPos: 1))
        myQuestions.append(Questions(qTitle: "Make realize the truth or validity of something", ans: ["cupidity","coy","inclusive", "convince"], ansPos: 3))
        myQuestions.append(Questions(qTitle: "Make keen or more acute", ans: ["bland","intimate","ravel", "whet"], ansPos: 3))
        
    }
    
    func showQ()
    {
        correctOrIncorrect.isHidden = true;
        curr = myQuestions.randomElement()!
        let c = curr.getC()
            question.text = curr.question;
            firstChoice.setTitle(c[0], for: .normal)
            secondChoice.setTitle(c[1], for: .normal)
            thirdChoice.setTitle(c[2], for: .normal)
            fourthChoice.setTitle(c[3], for: .normal)
    }
    
}

