//
//  Const.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/29.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit


let __kScreenHeight__ = UIScreen.main.bounds.size.height
let __kScreenWidth__ = UIScreen.main.bounds.size.width
let __kStatusBarHeight__ = UIApplication.shared.statusBarFrame.size.height
let __kNavigationBarHeight__ = __kStatusBarHeight__ + 44
let __kTabbarSafeBottomMargin__ = safeAreaInsetsBottom()

func RGBCOLOR(r:CGFloat,_ g:CGFloat,_ b:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1.0)
}
func safeAreaInsetsBottom() -> CGFloat {
    if #available(iOS 11.0, *) {
        let safeAreaInsets = UIApplication.shared.keyWindow?.safeAreaInsets
        return safeAreaInsets!.bottom
    }else{
        return 0
    }
}

class Const: NSObject {
    
    
}
