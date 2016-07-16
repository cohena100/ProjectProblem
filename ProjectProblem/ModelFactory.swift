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
    let loggerProxy = LoggerProxy()
}

extension ModelFactory: IModelFactory {
    
    func setupElementsForMainTableViewController() -> (fileBrowserCommands: IFileBrowserCommands, loggerProxy: ILoggerProxy) {
        return (fileBrowserCommands: FileBrowserCommands(fileSystemProxy: fileSystemProxy, loggerProxy: loggerProxy), loggerProxy: loggerProxy)
    }
    
}