//
//  ModelFactoryMock.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class ModelFactoryMock {
    
    let fileSystemProxy = FileSystemProxyMock()
    let loggerProxy = LoggerProxyMock()
    
}

extension ModelFactoryMock: IModelFactory {
    
    func setupElementsForMainTableViewController() -> (fileBrowserCommands: IFileBrowserCommands, loggerProxy: ILoggerProxy) {
        return (fileBrowserCommands: FileBrowserCommands(fileSystemProxy: fileSystemProxy), loggerProxy: loggerProxy)
    }
    
}