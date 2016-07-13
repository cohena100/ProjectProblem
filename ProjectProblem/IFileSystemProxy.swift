//
//  IFileSystemProxy.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

protocol IFileSystemProxy {
    
    func folderContent(rootFolder: NSURL?) -> [FileModel]?
    
}