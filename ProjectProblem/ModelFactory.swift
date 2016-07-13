//
//  ModelFactory.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class ModelFactory {
    let fileSystemProxy = FileSystemProxy()
    let logger = LoggerProxy()
}

extension ModelFactory: IModelFactory {
    
    func getMainMediator(delegate delegate: MainMediatorDelegate?, rootFolder: NSURL?) -> MainMediator {
        return MainMediator(delegate: delegate, rootFolder: rootFolder, fileBrowserCommands: FileBrowserCommands(fileSystemProxy: fileSystemProxy), logger: logger)
    }
    
}