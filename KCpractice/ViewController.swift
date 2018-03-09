//
//  ViewController.swift
//  KCpractice
//
//  Created by Reo Kuriyama on 2018/02/22.
//  Copyright © 2018年 Reo Kuriyama. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let weekArray = ["月", "火", "水", "木", "金", "土"]
    
    let subjectArray = ["", "日本経済学", "", "", "", "", "", "", "", "", "", "", "", "", "金融論", "", "", "", "", "", "", "", "フィンテック", "", "", "", "", "", "", "ミクロ"]
    
    let cellMargin : CGFloat = 0.0
    
    let selectedSubject = "マクロ経済学"
    let selectedProfessor = "清家篤君"
    
    @IBOutlet weak var footer: UIView!
    @IBOutlet weak var aboveContent: UIView!
    @IBOutlet weak var timeTable: UICollectionView!
    @IBOutlet weak var Yjiku: UIStackView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var professorNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeTable.delegate = self
        timeTable.dataSource = self
        
//        footer.backgroundColor = UIColor(red:250/255, green:250/255.0, blue:250/255.0, alpha: 1)
        footer.layer.masksToBounds = false;
        footer.layer.shadowOffset = CGSize(width: 0, height: 0);
        footer.layer.shadowRadius = 1;
        footer.layer.shadowOpacity = 0.6;
        
        self.view.layoutIfNeeded()
//
//        let startColor = UIColor(red:65/255, green:0/255.0, blue:148/255.0, alpha: 1).cgColor
//        let endColor = UIColor(red:212/255, green:32/255.0, blue:55/255.0, alpha: 0.6).cgColor
//
//        let layer = CAGradientLayer()
//        layer.colors = [startColor, endColor]
//        layer.frame = aboveContent.bounds
//
//        aboveContent.layer.addSublayer(layer)
        
        timeTable.backgroundColor = UIColor.clear
        
        let yjikuHeight = aboveContent.bounds.height - 90
        let yjikuCellheight = yjikuHeight / 5
        
        Yjiku.heightAnchor.constraint(equalToConstant: yjikuHeight).isActive = true
        
        label1.heightAnchor.constraint(equalToConstant: yjikuCellheight).isActive = true
        label2.heightAnchor.constraint(equalToConstant: yjikuCellheight).isActive = true
        label3.heightAnchor.constraint(equalToConstant: yjikuCellheight).isActive = true
        label4.heightAnchor.constraint(equalToConstant: yjikuCellheight).isActive = true
        label5.heightAnchor.constraint(equalToConstant: yjikuCellheight).isActive = true
        
        subjectLabel.text = selectedSubject
        professorNameLabel.text = selectedProfessor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let safeArea = self.view.safeAreaInsets;
        let screenWidth = self.view.bounds.width
        
        let table = UIView(frame: CGRect(x: 0, y: safeArea.top, width: screenWidth, height: screenWidth))
        
        self.view.addSubview(table)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(section == 0){   //section:0は曜日を表示
            return 6
        }else{
            return 30        //section:1は時間割を表示
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //コレクションビューから識別子「CalendarCell」のセルを取得する
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
        if(indexPath.section == 0){             //曜日表示
            cell.textLabel.text = weekArray[indexPath.row]
            cell.textLabel.frame.origin = CGPoint(x: 0, y: -9)
            
        }else{                                  //時間割表示
            cell.button.frame = CGRect(x:0, y:0, width:cell.frame.width,  height: cell.frame.height)
            cell.button.setTitle(subjectArray[indexPath.row], for: UIControlState.normal)
            cell.button.addTarget(self, action: #selector(self.tapButton(_:)), for: UIControlEvents.touchUpInside)
        }
        return cell
    }
    
    @objc  func tapButton(_ sender: UIButton) {
        print("ボタンがタップされました！")
    }
    /*
     
     セルのレイアウト設定
     
     */
    //セルサイズの指定（UICollectionViewDelegateFlowLayoutで必須）　横幅いっぱいにセルが広がるようにしたい
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //        let numberOfMargin:CGFloat = 8.0
        //        let widths:CGFloat = (collectionView.frame.size.width - cellMargin * numberOfMargin)/CGFloat(6)
        let widths:CGFloat = (collectionView.frame.size.width)/CGFloat(6)
        if(indexPath.section == 0){
            let heights:CGFloat = 30
            return CGSize(width:widths,height:heights)
        }else{
            let heights:CGFloat = (aboveContent.bounds.height - 90) / 5
            return CGSize(width:widths,height:heights)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0.0 , 0.0 , 0.0 , 0.0 )  //マージン(top , left , bottom , right)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

