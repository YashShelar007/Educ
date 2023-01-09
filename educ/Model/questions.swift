//
//  questioins.swift
//  CSE335GroupProject
//
//  Created by NewUser on 11/30/22.
//

import Foundation

class Questions {
    
    let question:String
    let ans:[String]
    let ansPos:Int
    
    init(qTitle: String, ans: [String], ansPos: Int) {
        self.question = qTitle
        self.ans = ans
        self.ansPos = ansPos
    }
    
    func getC() -> [String] {
        return ans
    }
    
    func getA() -> String {
        return ans[ansPos]
    }
}
