//
//  day09ImageScrollerVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/8/6.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit


class day09ImageScrollerVC: UIViewController {

    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView.init(frame: self.view.frame)
        scrollView.delegate = self as UIScrollViewDelegate
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        scrollView.contentSize = CGSize.init(width: __kScreenWidth__, height: __kScreenHeight__)
        return scrollView
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView.init()//(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        imageView.isUserInteractionEnabled = true
        imageView.image = UIImage.init(named: "Steve")
        return imageView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.imageView)
        
        
        self.scrollView.snp_makeConstraints { (make) in
            make.top.equalTo(self.view.snp_top).offset(__kNavigationBarHeight__)
            make.left.equalTo(self.view.snp_left).offset(0)
            make.right.equalTo(self.view.snp_right).offset(0)
            make.bottom.equalTo(self.view.snp_bottom).offset(__kTabbarSafeBottomMargin__)
        }
        
        self.imageView.snp_makeConstraints { (make) in
            make.top.equalTo(self.scrollView.snp_top).offset(0)
            make.left.equalTo(self.scrollView.snp_left).offset(0)
            make.right.equalTo(self.scrollView.snp_right).offset(-20)
            make.bottom.equalTo(self.scrollView.snp_bottom).offset(-100)
        }
    }
    
    fileprivate func updateMinZoomScaleForSize(_ size : CGSize){
        //要获得最小的缩放比例，首先计算所需的缩放比例，以便根据其宽度在scrollView中紧贴imageView
        let widthScale = size.width/imageView.bounds.width
        let heightScale = size.height/imageView.bounds.height
        
        let minScale = min(widthScale, heightScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }
    
    fileprivate func updateContraintsForSize (_ size : CGSize){
        let yOffset = max(0, (size.height - imageView.frame.height)/2)
        imageView.snp_updateConstraints { (make) in
            make.topMargin.equalTo(yOffset)
            make.bottomMargin.equalTo(-yOffset)
        }
        
        let xOffset = max(0, (size.width - imageView.frame.width)/2)
        imageView.snp_updateConstraints { (make) in
            make.leftMargin.equalTo(xOffset)
            make.rightMargin.equalTo(-xOffset)
        }
        view.layoutIfNeeded()
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
}

extension day09ImageScrollerVC:UIScrollViewDelegate{
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateMinZoomScaleForSize(view!.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
}
