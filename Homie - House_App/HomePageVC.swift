//
//  HomePageVC.swift
//  House_App
//
//  Created by TryCatch Classes on 21/09/22.
//

import UIKit

class HomePageVC: UIViewController {
    
    // choices collection view
    @IBOutlet weak var collectV2: UICollectionView!
    
    // home collection view
    @IBOutlet weak var collectV: UICollectionView!
    
   
    
    
    //parameters
    var house = [ "Lynwood", "Beverly Hills", "Palos Verdes", "Lakewood", "El Monte", "Monrovia", "Lawndale", "Altadena", "Hacienda Heights", "Pico Rivera"]
    
    var rent = [ "$25,000","$89,000", "$34,000", "$55,000","$41,000","$57,000","$13,000","$33,000" ,"$19,000","$65,000"]
    
    var dist = ["1.7 km from you","2.7 km from you",
                "3.5 km from you","5.9 km from you",
                "3.6 km from you","5.3 km from you",
                "2.3 km from you","3.1 km from you",
                "1.6 km from you","3.2 km from you"]
    
    var count1 = [ "2","4","2","3","3","3","1","2","1","3"]
    
    var count2 = [ "1","3","1","2","2","1","2","1","3","2"]
    
    var count3 = [ "3","2","3","1","1","2","2","3","2","1"]
    
    var choices = [ "2 bedroom", "Good location", "Pet friendly", "Parking space", "Balcony view"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectV.dataSource = self
        collectV.delegate = self
        
        collectV2.dataSource = self
        collectV2.delegate = self

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true  //hides navigation bar
        collectV.layer.cornerRadius = 25
        
    }
}

extension HomePageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collectV2)
        {
            return 5
        }
        else
        {
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let block = collectV.dequeueReusableCell(withReuseIdentifier: "block", for: indexPath) as! blockCVC    // first CV cell
        
        if(collectionView == collectV2){
            let block2 = collectV2.dequeueReusableCell(withReuseIdentifier: "block2", for: indexPath) as! block2CVC    // Second CV cell
            block2.flow_label.text = choices[indexPath.row]
            block2.layer.cornerRadius = 25
            return block2
        }
        
        // 1st CV cell properties
        block.layer.cornerRadius = 25
        block.house_name.text = house[indexPath.row]
        block.house_rent.text = rent[indexPath.row]
        block.distance.text = dist[indexPath.row]
        block.faci_count.text = count1[indexPath.row]
        block.faci_count1.text = count2[indexPath.row]
        block.faci_count2.text = count3[indexPath.row]
        block.house_img.image = UIImage(named: house[indexPath.row])
        block.house_details.layer.cornerRadius = 15
        block.stack6.layer.borderWidth = 0.3
        block.stack6.layer.cornerRadius = 3
        block.stcak7.layer.borderWidth = 0.3
        block.stcak7.layer.cornerRadius = 3
        block.stack8.layer.borderWidth = 0.3
        block.stack8.layer.cornerRadius = 3
        block.likeview.layer.cornerRadius = 3
        
        return block
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (collectionView == collectV2){      // 1st CV
            let width = ((collectionView.frame.width - 15) / 3)
            let height = ((collectionView.frame.height - 30) / 1)
            
            return CGSize(width: width, height: height)
        }

        let width = ((collectionView.frame.width - 20) / 1)    // 2nd CV
        let height = ((collectionView.frame.height - 20) / 1)
        
        return CGSize(width: width, height: height)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if(collectionView == collectV2){     // 1st CV
            return UIEdgeInsets(top: 15, left: 5, bottom: 15, right: 5)
        }
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)  // 2nd CV
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt Section: Int) -> CGFloat{
        if( collectionView == collectV2){      
            return 5        }
        return 10
    }
            
    // when particular block clicked redirects to next page.
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let touch = storyboard?.instantiateViewController(withIdentifier: "HomeDetailVC") as! HomeDetailVC
        // variable.nextclass_var = array_ofthisclass[indexPath.row]
        touch.h_img = UIImage(named: house[indexPath.row])!
        touch.h_nme = house[indexPath.row]
        touch.h_rent = rent[indexPath.row]
        touch.fc1 = count1[indexPath.row]
        touch.fc2 = count2[indexPath.row]
        touch.fc3 = count3[indexPath.row]
        self.navigationController?.pushViewController(touch, animated: true)

    }
    
    
}

