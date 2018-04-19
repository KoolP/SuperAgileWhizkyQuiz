//
//  ButtonDesignExtension.swift
//  SuperAgileWhizkyQuiz
//
//  Created by Christian Persson on 2018-04-19.
//  Copyright © 2018 Patrik Rikama Hinnenberg. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func designButtons(button : UIButton) {
        button.layer.cornerRadius = 8
    }
    
    func setColors(button : UIButton) {
        button.backgroundColor = UIColor.brown
    }
    
}
