//
//  Const.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/29.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit


let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width

func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
class Const: NSObject {

}
