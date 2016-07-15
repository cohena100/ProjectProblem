//
//  FileSystemProxyMock.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class FileSystemProxyMock {
    
}

extension FileSystemProxyMock: IFileSystemProxy {
    
    func folderContent(rootFolder: NSURL?) -> [FileModel]? {
        if rootFolder == nil {
            return [
                FileModel(path: "a", isFolder: true),
                FileModel(path: "b.png", isFolder: false),
                FileModel(path: "blue.png", isFolder: false),
                FileModel(path: "green.jpg", isFolder: false),
                FileModel(path: "yellow.xcassets", isFolder: false),
            ]
        }
        if rootFolder?.relativePath == "a" {
            return [
                FileModel(path: "red.plist", isFolder: false),
                FileModel(path: "blue.png", isFolder: false),
                FileModel(path: "green.jpg", isFolder: false),
                FileModel(path: "yellow.xcassets", isFolder: false),
                FileModel(path: "purple.storyboardc", isFolder: false),
                FileModel(path: "cyan.what", isFolder: false),
            ]
        }
        return nil
    }
    
}