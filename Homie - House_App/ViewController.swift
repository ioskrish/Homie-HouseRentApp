//
//  ViewController.swift
//  House_App
//
//  Created by TryCatch Classes on 21/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    //App Logo
    @IBOutlet weak var icon: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //Directed to HomePage
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        icon.isHidden = true
        do{
            sleep(2)
        }
        let go = storyboard?.instantiateViewController(withIdentifier: "HomePageVC") as! HomePageVC
        self.navigationController?.pushViewController(go, animated: true)
        
    }


}

