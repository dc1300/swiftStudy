//
//  VideoCell.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/30.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

protocol VideoDelegate : class{
    func play1BtnDidClick(sender:UIButton)
}

struct Video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    weak var delegate : VideoDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        self.initSubViews()
        self.videoScreenshot.isUserInteractionEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initSubViews() {
        self.contentView.addSubview(videoScreenshot)
        self.videoScreenshot.addSubview(self.playBtn)
        self.videoScreenshot.addSubview(self.videoTitleLabel)
        self.videoScreenshot.addSubview(self.videoSourceLabel)
        self.videoScreenshot.snp_makeConstraints { (make) in
            make.left.right.top.bottom.equalToSuperview()
            make.height.equalTo(220).priorityHigh()
        }
        self.playBtn.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.videoScreenshot.snp_centerX)
            make.height.equalTo(100)
            make.width.equalTo(200)
            make.bottom.equalTo(self.videoTitleLabel.snp_top).offset(-13)
        }
        self.videoTitleLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(videoScreenshot.snp_centerX)
            make.height.equalTo(20)
            make.width.equalTo(playBtn)
            make.bottom.equalTo(videoSourceLabel.snp_top).offset(-4)
        }
        self.videoSourceLabel.snp_makeConstraints { (make) in
            make.centerX.equalTo(videoScreenshot.snp_centerX)
            make.height.equalTo(20)
            make.width.equalTo(videoScreenshot)
            make.bottom.equalTo(videoScreenshot.snp_bottom).offset(-3)
        }
    }
    
    @objc func playBtnDidClick(_ sender : UIButton){
        delegate?.play1BtnDidClick(sender: sender)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    lazy var videoScreenshot: UIImageView = {
        let videoScreenshot = UIImageView.init()
        return videoScreenshot
    }()
    
    lazy var playBtn: UIButton = {
        let playBtn = UIButton.init(type: UIButton.ButtonType.custom)
        playBtn .setImage(UIImage.init(named: "playBtn"), for: UIControl.State.normal)
        playBtn.addTarget(self, action: #selector(playBtnDidClick(_:)), for: UIControl.Event.touchUpInside)
        return playBtn
    }()
    
    lazy var videoTitleLabel: UILabel = {
        let videoTitleLabel = UILabel.init()
        videoTitleLabel.text = "Emoji Among Us"
        videoTitleLabel.textColor = UIColor.white
        videoTitleLabel.textAlignment = NSTextAlignment.center
        return videoTitleLabel
    }()
    
    lazy var videoSourceLabel: UILabel = {
        let videoSourceLabel = UILabel.init()
        videoSourceLabel.text = "Youtube - 06:32"
        videoSourceLabel.textAlignment = NSTextAlignment.center
        videoSourceLabel.textColor = UIColor.white
        return videoSourceLabel
    }()
    
    

}
