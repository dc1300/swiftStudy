//
//  Shape.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/24.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit


class Shape: NSObject {
    
    public var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}
