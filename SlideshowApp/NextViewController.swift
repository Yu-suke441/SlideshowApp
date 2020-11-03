//
//  NextViewController.swift
//  SlideshowApp
//
//  Created by Yusuke Murayama on 2020/11/03.
//  Copyright © 2020 Yusuke.Murayama. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

   
    @IBOutlet weak var largeImageView: UIImageView!
    
    var selectedImage:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        largeImageView.image = selectedImage
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
