//
//  HomeDetailVC.swift
//  House_App
//
//  Created by TryCatch Classes on 27/09/22.
//

import UIKit

class HomeDetailVC: UIViewController {

    //parameters
    var decors = ["d1","d2","d3","d4","d5","d6","d7","d8","d9","d10"]
    
    // inside top image
    
    @IBOutlet weak var inside_img: UIImageView!
    @IBOutlet weak var back_btn: UIButton!
    @IBOutlet weak var dstack1: UIStackView!
    @IBOutlet weak var heart: UIImageView!
    
    // detail stack2
    @IBOutlet weak var dstack2: UIStackView!
    @IBOutlet weak var home_info1: UILabel!
    @IBOutlet weak var home_info2: UILabel!
    
    // detail stack3
    @IBOutlet weak var dstack3: UIStackView!
    @IBOutlet weak var home_rent: UILabel!
    
    // detail stack4
    @IBOutlet weak var dstack4: UIStackView!
    @IBOutlet weak var c1: UILabel!
    
    
    // detail stack5
    @IBOutlet weak var dstack5: UIStackView!
    @IBOutlet weak var c2: UILabel!
    
    
    // detail stack6
    @IBOutlet weak var dstack6: UIStackView!
    @IBOutlet weak var c3: UILabel!
    
    // detail stack7
    @IBOutlet weak var dstack7: UIStackView!
    
    // next slide buttons
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    
    // down CV
    @IBOutlet weak var CollectV3: UICollectionView!
    
    //parsing data with current screen variables
    var h_nme = ""
    var h_rent = ""
    var fc1 = ""
    var fc2 = ""
    var fc3 = ""
    var h_img = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // data passing from variable to components
        inside_img.image = h_img
        home_info1.text = h_nme
        home_rent.text = h_rent
        c1.text = fc1
        c2.text = fc2
        c3.text = fc3
        
        
        // 3rd Collection View
        CollectV3.delegate = self
        CollectV3.dataSource = self
        
        //components properties
        btn2.layer.cornerRadius = 20
        btn1.layer.cornerRadius = 20
        btn1.layer.borderWidth = 0.5
        dstack4.layer.borderWidth = 0.3
        dstack4.layer.cornerRadius = 3
        dstack5.layer.borderWidth = 0.3
        dstack5.layer.cornerRadius = 3
        dstack6.layer.borderWidth = 0.3
        dstack6.layer.cornerRadius = 3
        
    }
    
    // map view button
    
    @IBAction func mapbtn(_ sender: Any) {
        let map = storyboard?.instantiateViewController(withIdentifier: "MapVC") as! MapVC
        self.navigationController?.pushViewController(map, animated: true)
    }
    
    
    
    //back button
    @IBAction func backbtn_action(_ sender: UIButton) {
        let back = storyboard?.instantiateViewController(withIdentifier: "HomePageVC") as! HomePageVC
        self.navigationController?.popViewController(animated: true)
    }
}

extension HomeDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let block3 = CollectV3.dequeueReusableCell(withReuseIdentifier: "block3", for: indexPath) as! block3CVC
        block3.layer.cornerRadius = 15
        block3.look.image = UIImage(named: decors[indexPath.row])
        return block3
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = ((collectionView.frame.width - 30) / 4)
        let height = ((collectionView.frame.height - 30) / 1)
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 0, bottom: 15, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 3
    }
}

