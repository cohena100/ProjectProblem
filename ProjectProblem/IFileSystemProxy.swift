//
//  IFileSystemProxy.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

protocol IFileSystemProxy: class {
    
    func folderContent(rootFolder: NSURL?) -> [FileModel]?
    
}