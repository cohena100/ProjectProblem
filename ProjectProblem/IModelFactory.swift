//
//  IModelFactory.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

protocol IModelFactory {
    
    func setupElementsForMainTableViewController() -> (fileBrowserCommands: FileBrowserCommands, loggerProxy: ILoggerProxy)
    
}