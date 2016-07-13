//
//  FileSystemProxy.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class FileSystemProxy {

}

extension FileSystemProxy: IFileSystemProxy {
    
    func folderContent(rootFolder: NSURL?) -> [FileModel]? {
        let subPath: String
        if let rootFolder = rootFolder {
            subPath = rootFolder.absoluteString
        } else {
            subPath = NSBundle.mainBundle().bundlePath
        }
        let fm = NSFileManager.defaultManager()
        var isFolder: ObjCBool = false
        if !fm.fileExistsAtPath(subPath, isDirectory: &isFolder) {
            abort()
        }
        if !isFolder {
            return nil
        }
        let contentOfDirectory: [String] = try! fm.contentsOfDirectoryAtPath(subPath)
        print("sub folder: \(subPath)")
        return contentOfDirectory.map { (file) -> FileModel in
            var isFolder: ObjCBool = false
            let fullPath = subPath + "/" + file
            if fm.fileExistsAtPath(fullPath, isDirectory: &isFolder) {
                print("file: \(file) isFolder: \(Bool(isFolder))")
            } else {
                abort()
            }
            return FileModel(path: fullPath, isFolder: Bool(isFolder))
        }
    }
    
}