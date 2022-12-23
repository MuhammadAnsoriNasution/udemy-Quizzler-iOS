//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Muhammad Ansori Nasution on 22/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation
struct Question{
    let question:String
    let answer:[String]
    let correctAnswer: String
    init(q:String, a:[String], correctAnswer:String){
        self.question=q
        self.answer=a
        self.correctAnswer=correctAnswer
    }
}
