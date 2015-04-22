//
//  MyCell.swift
//  
//
//  Created by hexin on 15/4/21.
//
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.redColor()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bounds = CGRectMake(0, 0, 200, bounds.height)
//        backgroundView?.frame = CGRectMake(0, 0, 200, bounds.height)
//        selectedBackgroundView?.frame = CGRectMake(0, 0, 200, bounds.height)
    }
}
