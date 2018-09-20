//
//  LocationCell.swift
//  k-force_ios
//
//  Created by John on 2018/4/26.
//  Copyright © 2018年 k-force team. All rights reserved.
//

import UIKit

class LocationCell: UITableViewCell {

    var nameLabel : UILabel! {
        didSet{
            nameLabel.numberOfLines = 0
        }
    }
    var addressLabel : UILabel! {
        didSet{
            addressLabel.numberOfLines = 0
        }
    }
    var worktimeLabel : UILabel!{
        didSet{
            worktimeLabel.numberOfLines = 0
        }
    }
    var distanceLabel :  UILabel!{
        didSet{
            distanceLabel.numberOfLines = 0
        }
    }
    var imgCharge : UIImageView!
    var iconTime : UIImageView!
    var iconAdress : UIImageView!
    var imgFav : UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
        initCellContens()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        
        
        
    }
    
    func initCellContens(){
   
    
////        imgCharge = UIImageView(image: UIImage(named: "store_picture"))
//        imgCharge = UIImageView(frame: CGRect(x: 12.0, y: 35.0, width: 108.0, height: 49.5))
//        imgCharge.image = UIImage(named: "store_picture")

        imgCharge = UIImageView(image: UIImage(named: "store_picture"))
        imgCharge.frame = CGRect(x: 12.0, y: 35.0, width: 108.0, height: 49.5)
        
        
        iconTime = UIImageView(image: UIImage(named: "time"))
        iconTime.frame = CGRect(x: 129.0 , y: 72.5 , width: 14.0, height: 14.0)
        
        iconAdress = UIImageView(image: UIImage(named: "addres"))
        iconAdress.frame = CGRect(x: 129.0 , y: 90.0 , width: 14.0, height: 14.0)
        
        
        
        worktimeLabel = UILabel(frame: CGRect(x: 148.0, y: 70.5, width: 100.5, height: 18))
        worktimeLabel.text = "worktime label"
        
        nameLabel = UILabel(frame: CGRect(x: 129.0, y: 19.5, width: 148.5, height: 40))
        nameLabel.text = "name label"
        
       
        
        
        addressLabel = UILabel(frame: CGRect(x: 148.0, y: 88.5, width: 137.5, height: 18.0))
        addressLabel.text = "address label"
        
        addressLabel.adjustsFontSizeToFitWidth = true
        addressLabel.minimumScaleFactor = 0.5
        
        
        addSubview(imgCharge)
        addSubview(iconTime)
        addSubview(iconAdress)
        addSubview(nameLabel)
        addSubview(worktimeLabel)
        addSubview(addressLabel)
    }

}
