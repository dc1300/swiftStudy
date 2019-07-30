//
//  ViewController.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/24.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit
import SnapKit

var counter = 0.0
var timer = Timer()
var isPlaying = false

let kTopViewHeight = kScreenHeight * 0.4 //倒计时试图高度
let kButtonHeight = kScreenHeight * 0.6  //开始暂停按钮高度
let kPauseButtonWidth = kScreenWidth * 0.4 //暂停按钮宽度
let kStartButtonWidth = kScreenWidth * 0.6 //开始按钮高度

class ViewController: UIViewController {
    //MARK - 懒加载
    //倒计时label
    private lazy var showLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.text = String(counter)
        label.textColor = UIColor.yellow
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = NSTextAlignment.center
        return label
    }()
    private lazy var topBackgroundView: UIView = {
        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kTopViewHeight))
        view.backgroundColor = UIColor.black
        return view
    }()
    
    lazy var resetButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect.zero
        button.setTitle("Reset", for: UIControl.State.normal)
        button.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button.setTitleColor(UIColor.black, for: UIControl.State.highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        button.backgroundColor = UIColor.clear
        button.addTarget(self, action: #selector(buttonDidClick(sender:)), for: UIControl.Event.touchUpInside)
        button.tag = 101
        return button
    }()
    
    
    lazy var pauseButton : UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect.zero
        button.setImage(UIImage.init(named: "pause"), for: UIControl.State.normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action: #selector(buttonDidClick(sender:)), for: UIControl.Event.touchUpInside)
        button.tag = 102
        return button
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton.init(type: UIButton.ButtonType.custom)
        button.frame = CGRect.zero
        button.setImage(UIImage.init(named: "play"), for: UIControl.State.normal)
        button.backgroundColor = UIColor.blue
        button.addTarget(self, action: #selector(buttonDidClick(sender:)), for: UIControl.Event.touchUpInside)
        button.tag = 103
        return button
    }()
    
    func setupUI(){
        self.view.addSubview(self.topBackgroundView)
        self.topBackgroundView.addSubview(self.showLabel)
        self.showLabel.snp_makeConstraints { (make) in
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(137)
            make.centerX.equalTo(self.topBackgroundView.snp_centerX)
            make.centerY.equalTo(self.topBackgroundView.snp_centerY)
        }
        self.topBackgroundView.addSubview(self.resetButton)
        self.resetButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.topBackgroundView.snp_top).offset(20+64)
            make.right.equalTo(self.topBackgroundView.snp_right).offset(-20)
            make.height.equalTo(20)
            make.width.equalTo(60)
        }
        self.view.addSubview(self.pauseButton)
        self.pauseButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.topBackgroundView.snp_bottom).offset(0)
            make.left.equalTo(self.view).offset(0)
            make.height.equalTo(kButtonHeight)
            make.width.equalTo(kPauseButtonWidth)
        }
        self.view.addSubview(self.startButton)
        self.startButton.snp_makeConstraints { (make) in
            make.top.equalTo(self.topBackgroundView.snp_bottom).offset(0)
            make.left.equalTo(self.pauseButton.snp_right).offset(0)
            make.height.equalTo(kButtonHeight)
            make.width.equalTo(kStartButtonWidth)
        }
    }
    
    //MARK: - ButtonClick
    @objc func buttonDidClick(sender: AnyObject) {
        switch sender.tag {
        case 101:
            timer.invalidate()
            isPlaying = false
            counter = 0.0
            self.showLabel.text = String(counter)
            self.startButton.isEnabled = true
            self.pauseButton.isEnabled = false
        case 102:
            self.startButton.isEnabled = true
            self.pauseButton.isEnabled = false
            isPlaying = false
            timer.invalidate()
        case 103:
            if isPlaying {
                return
            }
            self.startButton.isEnabled = false
            self.pauseButton.isEnabled = true
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            isPlaying = true
        default:
            break
        }
    }
    
    @objc func updateTimer() {
        counter = counter + 0.1
        self.showLabel.text = String(format: "%.1f", counter)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let shape = Shape()
        print(shape.simpleDescription())
        
        let average1 = average(numbers: 1,2,3,4)
        print(average1)
        
        let numbers = [19,12,3,10]
        let result = hasAnyMatches(list: numbers, condition: lessThanTen)
        print(result)
        
        self.view.backgroundColor = UIColor.white
        setupUI()
        
    }

    func average(numbers:Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
    }
    
    func hasAnyMatches(list:[Int],condition:(Int) -> Bool) -> Bool {
        for item in list {
            if (condition(item)){
                return true
            }
        }
        return false
    }
    
    func lessThanTen(number:Int) -> Bool {
        return number < 10
    }
}



