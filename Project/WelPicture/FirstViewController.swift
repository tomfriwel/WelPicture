//
//  FirstViewController.swift
//  WelPicture
//
//  Created by tomfriwel on 2018/12/5.
//  Copyright © 2018 tomfriwel. All rights reserved.
//

import UIKit
import PhotoCropEditor

class FirstViewController: UIViewController, CropViewControllerDelegate {
    
    @IBOutlet weak var showView: UIImageView!
    var navController:UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupStyle()
        displayImage()
    }
    
    @IBAction func display(_ sender: Any) {
        showCrop()
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
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        //        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        //        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    func generateSquare(image:UIImage, sizes:Array<Int>) -> Array<UIImage> {
        var images:Array<UIImage> = []
        for size in sizes {
            print(size)
            
            UIGraphicsBeginImageContext(CGSize(width: size, height: size))
            image.draw(in: CGRect(x: 0, y: 0, width: size, height: size))
            let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            images.append(newImage)
        }
        print(images)
        return images
    }
    
    func displayImage() -> Void {
        if let image = UIImage(named:"philipp-pilz-1201277-unsplash.jpg") {
            showView.image = image
            //            ImageInfo(image: image)
        }
        print(getSizes())
    }
    
    func showCrop()->Void {
        let controller = CropViewController()
        controller.delegate = self
        controller.image = showView.image
        
        navController = UINavigationController(rootViewController: controller)
        present(navController!, animated: true, completion: nil)
    }
    
    func getSizes() -> Array<CGFloat> {
        let appicon = [
            "iPhoneNotification":[
                "original":20,
                "x":[2, 3],
                "title": "iPhone Notification"
            ],
            "iPhoneSetting":[
                "original":29,
                "x":[2, 3],
                "title": "iPhone Setting"
            ],
            "iPhoneSpotlight":[
                "original":40,
                "x":[2, 3],
                "title": "iPhone Spotlight"
            ],
            "iPhoneApp":[
                "original":60,
                "x":[2, 3],
                "title": "iPhone App"
            ],
            "iPadNotifications":[
                "original":20,
                "x":[1, 2],
                "title": "iPad Notifications"
            ],
            "iPadSettings":[
                "original":29,
                "x":[1, 2],
                "title": "iPad Settings"
            ],
            "iPadSpotlight":[
                "original":40,
                "x":[1, 2],
                "title": "iPad Spotlight"
            ],
            "iPadApp":[
                "original":76,
                "x":[1, 2],
                "title": "iPad App"
            ],
            "iPadPro12.9":[
                "original":83.5,
                "x":[2],
                "title": "iPad Pro (12.9-inch) App"
            ],
            "AppStore":[
                "original":1024,
                "x":[1],
                "title": "App Store"
            ],
            ]
        
        var sizes:Array<CGFloat> = []
        for (_, item) in appicon {
            let x:Array<Int> = item["x"] as! Array<Int>
            let o:CGFloat = CGFloat(item["original"])
            for i in x {
                sizes.append(o * CGFloat(i))
            }
        }
        return sizes
    }
    
    //    MARK: CropViewControllerDelegate
    
    func cropViewController(_ controller: CropViewController, didFinishCroppingImage image: UIImage) {
        navController!.dismiss(animated: true, completion:{
            let images = self.generateSquare(image: image, sizes: [50, 70, 108, 40])
            let avc = UIActivityViewController(activityItems: images, applicationActivities: nil)
            self.present(avc, animated: true, completion: nil)
        })
        
    }
    
    func cropViewController(_ controller: CropViewController, didFinishCroppingImage image: UIImage, transform: CGAffineTransform, cropRect: CGRect) {
        //        navController!.dismiss(animated: true, completion: nil)
    }
    
    func cropViewControllerDidCancel(_ controller: CropViewController) {
        navController!.dismiss(animated: true, completion: nil)
    }
    
}

