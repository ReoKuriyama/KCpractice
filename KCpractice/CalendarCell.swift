//
//  CalendarCell.swift
//  KCpractice
//
//  Created by Reo Kuriyama on 2018/03/07.
//  Copyright © 2018年 Reo Kuriyama. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    var textLabel : UILabel!
    var button : UIButton!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)!

        //UILabelを生成
        textLabel = UILabel(frame: CGRect(x:0, y:0, width:self.frame.width,  height: self.frame.height))
        textLabel.font = UIFont(name: "HiraKakuProN-W3", size: 18)
        textLabel.textColor = UIColor.white
        textLabel.textAlignment = NSTextAlignment.center
        
        //UIButtonを生成
        button = UIButton()
        button.titleLabel!.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        button.titleLabel?.numberOfLines = 4;
        
        // Cellに追加
        self.addSubview(textLabel!)
        self.addSubview(button!)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
