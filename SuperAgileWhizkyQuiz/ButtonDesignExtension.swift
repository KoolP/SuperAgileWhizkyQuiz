//
//  ButtonDesignExtension.swift
//  SuperAgileWhizkyQuiz
//
//  Created by Christian Persson on 2018-04-19.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//
import Foundation
import UIKit
import QuartzCore

extension UIView {
    
    func designButtons(button : UIButton) {
        button.layer.cornerRadius = 8
        button.titleLabel?.font = UIFont(name: "American Typewriter", size: 16)
        
    }
    
    func setColors(button : UIButton) {
        button.backgroundColor = UIColor(red: 243.0/255.0, green: 193.0/255.0, blue: 49.0/255.0, alpha: 0.5)
    }
    
    func designLabel(label : UILabel) {
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.font = UIFont(name: "American Typewriter", size: 16)
        label.backgroundColor = UIColor(red: 243.0/255.0, green: 193.0/255.0, blue: 49.0/255.0, alpha: 0.5)
    }
    
    func designLabel2(label : UILabel) {
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 8
        label.font = UIFont(name: "American Typewriter", size: 19)
        label.backgroundColor = UIColor(red: 243.0/255.0, green: 193.0/255.0, blue: 49.0/255.0, alpha: 0.5)
    }

    
}

//extension UILabel {
//    func designLabel(label : UILabel) {
//        label.layer.cornerRadius = 8
//    }
//}
