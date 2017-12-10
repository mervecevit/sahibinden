//
//  LineChartView.swift
//  Gem Code
//
//  Created by Merve Ecevit on 10/12/17.
//

import UIKit
import Charts
import UIColor_FlatColors

class ScoinCellView: UITableViewCell {
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Date"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.background
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.textColor = UIColor.white
        label.backgroundColor = UIColor.background
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        addSubview(dateLabel)
        addSubview(valueLabel)
        setUpDateLabel()
        setUpValueLabel()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpDateLabel() {
        //dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -8).isActive = true
        //dateLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: -8).isActive = true
        //dateLabel.rightAnchor.constraint(equalTo: valueLabel.leftAnchor, constant: 8).isActive = true
        //dateLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        //dateLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        //dateLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    func setUpValueLabel() {
        //valueLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: -8).isActive = true
        //valueLabel.leftAnchor.constraint(equalTo: dateLabel.rightAnchor, constant: -8).isActive = true
        //valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        //valueLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        //valueLabel.widthAnchor.constraint(equalToConstant: 48).isActive = true
        //valueLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
}

