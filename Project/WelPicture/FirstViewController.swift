//
//  FirstViewController.swift
//  WelPicture
//
//  Created by tomfriwel on 2018/12/5.
//  Copyright © 2018 tomfriwel. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var showView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupStyle()
        displayImage()
    }
    
    @IBAction func display(_ sender: Any) {
        displayImage()
    }
    
    func setupStyle() -> Void {
//        border
        showView.layer.borderWidth = 1.0
        showView.layer.borderColor = UIColor.gray.cgColor
        
//        shadow
        showView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        showView.layer.shadowColor = UIColor.black.cgColor
        showView.layer.shadowRadius = 4
        showView.layer.shadowOpacity = 0.25
        showView.layer.masksToBounds = false;
        showView.clipsToBounds = false;
    }
    
    func displayImage() -> Void {
        if let image = UIImage(named:"philipp-pilz-1201277-unsplash.jpg") {
            showView.image = image
            print(image.size)
            print(image.scale)
            print(image.imageOrientation)
            print(image.imageRendererFormat)
            print(image.imageAsset)
            ImageInfo(image: image)
        }
    }

}

