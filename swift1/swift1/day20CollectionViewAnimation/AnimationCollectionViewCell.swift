//
//  AnimationCollectionViewCell.swift
//  swift1
//
//  Created by 戴晨 on 2019/8/6.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

class AnimationCollectionViewCell: UICollectionViewCell {
    lazy var backButton: UIButton = {
        let backButton = UIButton.init(type: UIButton.ButtonType.custom)
         backButton.setImage(UIImage.init(named: "Back-icon"), for: UIControl.State.normal)
        
        return backButton
    }()
    
    lazy var animationImageView: UIImageView = {
        let animationImageView = UIImageView.init()
        return animationImageView
    }()
    
    lazy var animationTextView: UITextView = {
        let animationTextView = UITextView.init()
        return animationTextView
    }()
    
    
    var backButtonTapped : (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(self.animationImageView)
        self.addSubview(self.backButton)
        self.addSubview(self.animationTextView)
        
        self.animationImageView.snp_makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(140)
        }
        self.backButton.snp_makeConstraints { (make) in
            make.top.equalTo(self).offset(12)
            make.left.equalTo(self).offset(10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        self.animationTextView.snp_makeConstraints { (make) in
            make.top.equalTo(self.animationImageView.snp_bottom)
            make.left.equalTo(self.snp_left).offset(0)
            make.right.equalTo(self.snp_right).offset(0)
            make.bottom.equalTo(self.snp_bottom).offset(0)
        }
        self.animationTextView.text = "创建 HomeNavItemController.swift，作为上述页面的后台代码，关联方式如上图右上角 Custom Class 所示。至此，界面端的工作就全部完毕了。"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Cell 初始化失败");
    }
    
    func prepareCell(_ viewModel: AnimationCellModel) {
        animationImageView.image = UIImage(named: viewModel.imagePath)
        animationTextView.isScrollEnabled = false
        backButton.isHidden = true
        addTapEventHandler()
    }
    
    func handleCellSelected(){
        animationTextView.isScrollEnabled = false
        backButton.isHidden = false
        self.superview?.bringSubviewToFront(self)
    }
    
    private func addTapEventHandler() {
        backButton.addTarget(self, action: #selector(backButtonDidTouch(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func backButtonDidTouch(_ sender: UIGestureRecognizer){
        backButtonTapped?()
    }
    
}
