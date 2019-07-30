//
//  LeftViewVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/30.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

class LeftViewVC: UIViewController {
    lazy var backgroundImageView: UIImageView = {
        let backgroundImageView : UIImageView = UIImageView.init(frame: self.view.frame)
        backgroundImageView.image = UIImage.init(named: "left")
        return backgroundImageView;
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.backgroundImageView)
        // Do any additional setup after loading the view.
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
