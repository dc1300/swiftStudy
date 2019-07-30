//
//  playLocalVideoVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/30.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class playLocalVideoVC: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.grouped)
        tableView.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var dataSource = [ Video(image: "videoScreenshot01",
                             title: "Introduce 3DS Mario",
                             source: "Youtube - 06:32"),
                       Video(image: "videoScreenshot02",
                             title: "Emoji Among Us",
                             source: "Vimeo - 3:34"),
                       Video(image: "videoScreenshot03",
                             title: "Seals Documentary",
                             source: "Vine - 00:06"),
                       Video(image: "videoScreenshot04",
                             title: "Adventure Time",
                             source: "Youtube - 02:39"),
                       Video(image: "videoScreenshot05",
                             title: "Facebook HQ",
                             source: "Facebook - 10:20"),
                       Video(image: "videoScreenshot06",
                             title: "Lijiang Lugu Lake",
                             source: "Allen - 20:30")]
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        
    }
}

extension playLocalVideoVC:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:VideoCell = tableView .dequeueReusableCell(withIdentifier: "VideoCell") as! VideoCell
        let video = dataSource[indexPath.row]
        
        cell.videoScreenshot.image = UIImage(named: video.image)
        cell.videoTitleLabel.text = video.title
        cell.videoSourceLabel.text = video.source
        cell.delegate = self
        return cell
    }
}

extension playLocalVideoVC:VideoDelegate{
    func play1BtnDidClick(sender: UIButton) {
        let path = Bundle.main.path(forResource: "emoji zone", ofType: "mp4")
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playerView
        
        // 知识点：尾随闭包
        // 在使用尾随闭包时，你不用写出它的参数标签
        // 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉
        // 完整形式如下：
        //self.present(playViewController, animated: true, completion: {
        //    self.playViewController.player?.play()
        //})
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}
