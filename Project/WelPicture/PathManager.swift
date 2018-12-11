//
//  PathManager.swift
//  WelPicture
//
//  Created by tomfriwel on 2018/12/11.
//  Copyright © 2018 tomfriwel. All rights reserved.
//

import Foundation

class PathManager {
    static var shared = PathManager()
    private let internalQueue = DispatchQueue(label: "SingletionInternalQueue", qos: .default, attributes: .concurrent)
    
    private var _foo: String = "aaa"
    
    var foo: String {
        get {
            return internalQueue.sync { _foo }
        }
        set (newState) {
            internalQueue.async(flags: .barrier) { self._foo = newState }
        }
    }
    
    func setup(string: String) {
        foo = string
    }
    
    lazy var userPath = {
        
    }
    
    lazy var documentsDirectory:String = ()->String{
        let paths:Array<String> = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as Array<String>
        return paths[0]
//            paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//            _documentsDirectory = [paths objectAtIndex:0];
        
            //for test
//            #ifdef SIMULATOR_TEST
//            _documentsDirectory = @"/Users/Shared";
//            NSLog(@"use shared folder");
//#endif
//}
//return _documentsDirectory;
    }
    
}
