//
//  ViewController.swift
//  Tyler Remy CPSC 5330 Assignment 5
//
//  Created by user251942 on 2/10/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameLabel: UILabel!
    
    @IBOutlet weak var decisionLabel: UILabel!
    
    @IBOutlet weak var optionOne: UIButton!
    
    @IBOutlet weak var optionTwo: UIButton!
    
    var molelogic = moleLogic()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Set random department for the mole
        molelogic.setMoleDept()
        
        //Update UI
        updateUI()
    }

    @IBAction func optionSelected(_ sender: UIButton) {
        
        let userSelection = sender.titleLabel!.text!
        
        molelogic.checkDepartment(userSelection)
        
        if molelogic.foundMole {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
               
    }
    
   @objc func updateUI() {
        
    var moleFound = molelogic.foundMole
    var gameover = molelogic.gameover
       
       //Check if game not over
       if !gameover {
           
           decisionLabel.text = molelogic.getNextInvestigationStep()
           optionOne.setTitle(molelogic.getOptionOne(), for: .normal)
           optionTwo.setTitle(molelogic.getOptionTwo(), for: .normal)
           
       }
       else if moleFound {
           //Game Over and Mole Found Message
           decisionLabel.text = "Mole Found"
           optionOne.setTitle("", for: .normal)
           optionTwo.setTitle("", for: .normal)       }
       else {
           //Game Over and Mole Not Found
           decisionLabel.text = "Mole Not Found!"
           optionOne.setTitle("", for: .normal)
           optionTwo.setTitle("", for: .normal)
       }
    }
    
}

