//
//  ImageInfo.swift
//  WelPicture
//
//  Created by tomfriwel on 2018/12/6.
//  Copyright © 2018 tomfriwel. All rights reserved.
//

import UIKit
//import Photos

class ImageInfo {
    let size:CGSize
    let capacity: Int
    init(image:UIImage) {
        size = image.size
        capacity = NSData.init(data: image.pngData()!).length
        print(size)
        print(capacity/1024/1024)
        print(NSData.init(data: image.jpegData(compressionQuality: 0.5)!).length/1024/1024)
        retrieve(image: image.cgImage!)
        
        let fileName: String = "philipp-pilz-1201277-unsplash"
        var fileSize : UInt64
        if let filePath = Bundle.main.path(forResource: fileName, ofType: "jpg") {
            print(filePath)
            do {
                //return [FileAttributeKey : Any]
                let attr = try FileManager.default.attributesOfItem(atPath: filePath)
                fileSize = attr[FileAttributeKey.size] as! UInt64
                
                //if you convert to NSDictionary, you can get file size old way as well.
                let dict = attr as NSDictionary
                fileSize = dict.fileSize()
                print("fileSize:\(Double(fileSize)/1024.0/1024.0)")
            } catch {
                print("Error: \(error)")
            }
        } else {
            print("no file")
        }
        
    }
    
    func retrieve(image:CGImage)->Void {
        print("cg image info:")
        print(image.isMask)
        print(image.width) //3773
        print(image.height) //5659
        print(image.bitsPerComponent) //8
        print(image.bitsPerPixel) //32
        print(image.bytesPerRow) //15092 = 3773*4
        print(image.colorSpace) //Optional(<CGColorSpace 0x600002f63a20> (kCGColorSpaceICCBased; kCGColorSpaceModelRGB; sRGB IEC61966-2.1))
        print("alphaInfo:\(image.alphaInfo.rawValue)") //CGImageAlphaInfo
//        print(image.dataProvider) //Optional(<CGDataProvider 0x7fbf8c501280 [0x104c67b68]>)
//        print(image.decode) //nil
//        print(image.shouldInterpolate) //true
        print("renderingIntent:\(image.renderingIntent.rawValue)") //CGColorRenderingIntent
        print(image.bitmapInfo) //CGBitmapInfo(rawValue: 5)
        print(image.utType) //Optional(public.jpeg)
//        print(image.byteOrderInfo.rawValue) //CGImageByteOrderInfo
//        print(image.pixelFormatInfo.rawValue) //CGImagePixelFormatInfo
        
        
    }
}
