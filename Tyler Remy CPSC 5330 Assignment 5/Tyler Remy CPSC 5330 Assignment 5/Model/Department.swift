//
//  Department.swift
//  Tyler Remy CPSC 5330 Assignment 5
//
//  Created by user251942 on 2/11/24.
//

import Foundation

struct Department {
    
    init(_ mess: String, _ optOne: String, _ optTwo: String ) {
        investigationMessage = mess
        option_One = optOne
        option_Two = optTwo
        
    }
    
    var investigationMessage: String
    var option_One: String
    var option_Two: String
    
}
