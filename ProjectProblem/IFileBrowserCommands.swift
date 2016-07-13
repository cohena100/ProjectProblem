//
//  IFileBrowserCommands.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

protocol IFileBrowserCommands {
    
    func folderContent(rootFolder: NSURL?) -> [FileUI]?
    
}