//
//  PatternCell.swift
//  swift1
//
//  Created by 戴晨 on 2019/8/6.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

struct pattern {
    let image : String
    let name  : String
}

class PatternCell: UITableViewCell {

    lazy var patternNameLabel: UILabel = {
        let patternNameLabel = UILabel.init()
        patternNameLabel.textColor = UIColor.darkGray
        patternNameLabel.font = UIFont.systemFont(ofSize: 16)
        return patternNameLabel
    }()
    
    lazy var patternImageView: UIImageView = {
        let patternImageView = UIImageView.init()
        return patternImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(self.patternImageView)
        self.contentView.addSubview(self.patternNameLabel)
        
        self.patternImageView.snp_makeConstraints { (make) in
            make.top.left.bottom.equalToSuperview()
            make.width.equalTo(150)
        }
        
        self.patternNameLabel.snp_makeConstraints { (make) in
            make.centerY.equalTo(self.patternImageView.snp_centerY)
            make.left.equalTo(self.patternImageView.snp_right)
            make.right.equalTo(self.contentView.snp_right)
            make.height.equalTo(25)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
