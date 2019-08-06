//
//  AnimationImageCollection.swift
//  swift1
//
//  Created by 戴晨 on 2019/8/6.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

struct AnimationImageCollection {
    private let imagePaths = ["1","2","3","4","5"]
    var images : [AnimationCellModel]
    
    init() {
        images = imagePaths.map({ (imageStr) -> AnimationCellModel in
            AnimationCellModel.init(imagePath: imageStr)
        })
            //imagePaths.map(AnimationCellModel(imagePath: $0))
    }
    
}
