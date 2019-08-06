//
//  day21SwipeableVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/8/6.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

class day21SwipeableVC: UIViewController {

    var data = [
        pattern(image: "day21SwipeableVC1", name: "Pattern Building"),
        pattern(image: "day21SwipeableVC2", name: "Joe Beez"),
        pattern(image: "day21SwipeableVC3", name: "Car It's car"),
        pattern(image: "day21SwipeableVC4", name: "Floral Kaleidoscopic"),
        pattern(image: "day21SwipeableVC5", name: "Sprinkle Pattern"),
        pattern(image: "day21SwipeableVC6", name: "Palitos de queso"),
        pattern(image: "day21SwipeableVC7", name: "Ready to Go? Pattern"),
        pattern(image: "day21SwipeableVC8", name: "Sets Seamless"),
    ]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.grouped)
        tableView.register(PatternCell.self, forCellReuseIdentifier: "PatternCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 60
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        
    }
}


extension day21SwipeableVC : UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PatternCell", for: indexPath) as! PatternCell
        let pattern = data[indexPath.row]
        
        cell.patternImageView.image = UIImage(named: pattern.image)
        cell.patternNameLabel.text = pattern.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction.init(style: UITableViewRowAction.Style.normal, title: "🗑\nDelete") { (action, index) in
            print("Delete button tapped")
        }
        delete.backgroundColor = UIColor.gray
        
        let share = UITableViewRowAction(style: .normal, title: "🤗\nShare") { (action, indexPath) in
            let firstActivityItem = self.data[indexPath.row]
            let activityViewController = UIActivityViewController(activityItems: [firstActivityItem.image as NSString], applicationActivities: nil)
            
            self.present(activityViewController, animated: true, completion: nil)
        }
        share.backgroundColor = UIColor.red
        
        let download = UITableViewRowAction(style: .normal, title: "⬇️\nDownload") { action, index in
            print("Download button tapped")
        }
        download.backgroundColor = UIColor.blue
        
        return [download, share, delete]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            print("Delete")
        case .insert:
            print("Insert")
        case .none:
            print("None")
        @unknown default:
            fatalError()
        }
    }
}
