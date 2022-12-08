//
//  blockCVC.swift
//  House_App
//
//  Created by TryCatch Classes on 22/09/22.
//

import UIKit

class blockCVC: UICollectionViewCell {
    
    //cell outlets
    
    @IBOutlet weak var house_img: UIImageView!
    @IBOutlet weak var house_like: UIImageView!
    @IBOutlet weak var house_name: UILabel!
    
    //stack4 items
    @IBOutlet weak var stack4: UIStackView!
    @IBOutlet weak var distance: UILabel!
    
    //stack5 items
    @IBOutlet weak var stack5: UIStackView!
    @IBOutlet weak var house_rent: UILabel!
    
    //stack6 items
    @IBOutlet weak var stack6: UIStackView!
    @IBOutlet weak var facilities: UIImageView!
    @IBOutlet weak var faci_count: UILabel!
    
    //stack7 items
    @IBOutlet weak var stcak7: UIStackView!
    @IBOutlet weak var faci_count1: UILabel!
    
    //stack8 items
    @IBOutlet weak var stack8: UIStackView!
    @IBOutlet weak var likeview: UIView!
    @IBOutlet weak var faci_count2: UILabel!
    @IBOutlet weak var like: UIButton!

    
    //Next Screen Button
    @IBOutlet weak var house_details: UIButton!
    
    @IBAction func likebtn(_ sender: UIButton) {
        if like.tag == 0 {
            like.setImage(UIImage(systemName: "heart.fill"), for: .normal)
           like.tag = 1
        }
        else
        {
           like.setImage(UIImage(systemName: "heart"), for: .normal)
            like.tag = 0
        }
    }
    
}




