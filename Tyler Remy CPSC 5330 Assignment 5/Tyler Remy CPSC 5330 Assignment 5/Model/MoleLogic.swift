//
//  MoleLogic.swift
//  Tyler Remy CPSC 5330 Assignment 5
//
//  Created by user251942 on 2/11/24.
//

import Foundation

struct moleLogic {
    
    //Variable for stage of investigation
    var investigationIndex : Int = 0
    
    //Variable for whether mole was found or not
    var foundMole : Bool = false
    
    //Array of subdepartments that could contain the mole to select randomly from
    let subdepartments = ["Accountants", "Finance Managers", "Lawyers", "Legal Aides"]
    
    //Variable for which subdepartment contains mole
    var moleDeptName: String = ""
    
    //Variable for ending game
    var gameover : Bool = false
    
    
     let department = [
        Department("A mole has infiltrated your organization! Select a deparment to begin investigating for the mole!",
                   "Finance Department",
                   "Legal Department"),
        Department("The finance department includes both accountants and financial managers. Both are good suspects for the mole, which would you like to investigate?",
                   "Accountants",
                   "Financial Managers"),
        Department("The Legal department includes both Laywers and Legal Aides. Both are good suspects for the mole, which would you like to investigate?",
                   "Lawyers",
                   "Legal Aides")
    ]
    
    mutating func checkDepartment(_ selection: String) {
        
        if selection == moleDeptName {
            foundMole = true
            gameover = true
        }
    
    }
    
    mutating func updateInvestigationIndex(_ selection: String) {
        
        if investigationIndex < 3 {
            if selection == "Finance Department" {
                investigationIndex += 1
            } else {
                investigationIndex += 2
            }
        } else {
            investigationIndex = 3
            gameover = true
        }
    }
    
    mutating func setMoleDept() {
        moleDeptName = subdepartments.randomElement()!
    }
    
    func getMoleDept() -> String {
        return moleDeptName
    }
    
    func getNextInvestigationStep() -> String {
        return department[investigationIndex].investigationMessage
    }
    
    func getOptionOne() -> String {
        return department[investigationIndex].option_One
    }
    
    func getOptionTwo() -> String {
        return department[investigationIndex].option_Two   }
}
