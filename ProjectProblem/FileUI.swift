//
//  FileUI.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import UIKit

class FileUI: FileModel {
    
    var color: UIColor {
        get {
            guard let fileExtention = self.fileExtention else {
                return UIColor.cyanColor()
            }
            switch fileExtention {
            case "plist":
                return UIColor.redColor()
            case "png":
                return UIColor.blueColor()
            case "jpg":
                return UIColor.greenColor()
            case "xcassets":
                return UIColor.yellowColor()
            case "storyboardc":
                return UIColor.purpleColor()
            default:
                return UIColor.cyanColor()
            }
        }
    }
    
    init(file: FileModel) {
        super.init(path: file.path, isFolder: file.isFolder)
    }
    
}