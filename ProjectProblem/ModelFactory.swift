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
}

extension ModelFactory: IModelFactory {
    
    func getMainMediator(delegate: MainMediatorDelegate?) -> MainMediator {
        return MainMediator(delegate: delegate, fileBrowserCommands: FileBrowserCommands(fileSystemProxy: fileSystemProxy))
    }
    
}