//
//  ViewController.swift
//  test
//
//  Created by hexin on 15/4/21.
//  Copyright (c) 2015年 hexin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var data = ["1 afjkdahfjk\nashfkd", "2 fdhsjhajwehfbh\navbdshlblalsbhdj", "3 ajdfhajklfhjabshbehblh", "4djafhjkladebjdafhjdahbhabeihajebabejbadkjlbvc哈哈hbbebjbejbjacbjbjelkabj"]
    var propertyCell: MyCell!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let nib = UINib(nibName: "MyCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! MyCell
        cell.label.text = data[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if propertyCell == nil {
            let cells = UINib(nibName: "MyCell", bundle: nil).instantiateWithOwner(nil, options: nil) as! [MyCell]
            propertyCell = cells[0]
        }
        propertyCell.label.text = data[indexPath.row]
        propertyCell.label.preferredMaxLayoutWidth = propertyCell.label.bounds.width
        //propertyCell.label.preferredMaxLayoutWidth = propertyCell.label.bounds.width之后，再进行layout，label的width才会变正确
        //在完成cell的config以后使用以下，保证height的计算正确
        propertyCell.setNeedsLayout()
        propertyCell.layoutIfNeeded()
        
        println(propertyCell.bounds.width)
        println(propertyCell.label.bounds.width)

        var height = propertyCell.contentView.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height + 1
        return height + 1
    }
}

