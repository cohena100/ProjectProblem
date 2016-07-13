//
//  FileModel.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class FileModel {
    
    let path: NSURL
    let isFolder: Bool
    var name: String {
        get {
            return path.lastPathComponent!
        }
    }
    var fileExtention: String? {
        get {
            return path.pathExtension
        }
    }
    
    init(path: NSURL, isFolder: Bool) {
        self.path = path
        self.isFolder = isFolder
    }
    
    convenience init(path: String, isFolder: Bool) {
        self.init(path: NSURL(fileURLWithPath: path), isFolder: isFolder)
    }
    
}