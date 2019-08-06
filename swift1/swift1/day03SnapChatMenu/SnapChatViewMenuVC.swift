//
//  SnapChatViewMenuVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/30.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

class SnapChatViewMenuVC: UIViewController , UIScrollViewDelegate{

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: self.view.frame)
        scrollView.delegate = self
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let leftView:LeftViewVC = LeftViewVC.init()
        let centerView:CameraVC = CameraVC.init()
        let rightView:RightViewVC = RightViewVC.init()
        leftView.view.frame = CGRect.init(x: 0, y: 0, width: __kScreenWidth__, height: __kScreenHeight__)
        centerView.view.frame = CGRect.init(x: __kScreenWidth__, y: 0, width: __kScreenWidth__, height: __kScreenHeight__)
        rightView.view.frame = CGRect.init(x: 2*__kScreenWidth__, y: 0, width: __kScreenWidth__, height: __kScreenHeight__)
        
        self.addChild(leftView)
        self.addChild(centerView)
        self.addChild(rightView)
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(leftView.view)
        self.scrollView.addSubview(centerView.view)
        self.scrollView.addSubview(rightView.view)
        self.scrollView.contentSize = CGSize.init(width: __kScreenWidth__*3, height: __kScreenHeight__)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
