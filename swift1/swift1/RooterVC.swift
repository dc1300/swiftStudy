//
//  RooterVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/7/30.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

class RooterVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    

    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: self.view.frame, style: UITableView.Style.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    lazy var dataSource: [[String]] = {
        let dataSource = [["字体","ViewController"],
                          ["playLocalVideo","playLocalVideoVC"]]
        return dataSource
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.tableView)
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let array = dataSource[indexPath.row]
        cell.textLabel?.text = array.first
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let array = dataSource[indexPath.row]
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        
        let cls:AnyClass = NSClassFromString(namespace + "." + array.last!)!
//        let vcName = array.last
//        let cls:AnyClass = NSClassFromString(vcName!)!
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        self.navigationController?.pushViewController(vc, animated: true)
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
