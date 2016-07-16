//
//  MainMediator.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

protocol MainMediatorDelegate: class {
}

class MainMediator {
    
    let fileBrowserCommands: IFileBrowserCommands
    weak var logger: ILoggerProxy!
    weak var delegate: MainMediatorDelegate?
    var rootFolder: NSURL?
    var folderContent: [FileUI]?
    
    init(delegate: MainMediatorDelegate?, rootFolder: NSURL?, fileBrowserCommands: IFileBrowserCommands, logger: ILoggerProxy) {
        self.delegate = delegate
        self.fileBrowserCommands = fileBrowserCommands
        self.rootFolder = rootFolder
        self.logger = logger
        folderContent = fileBrowserCommands.folderContent(rootFolder)
        let logLine: String
        if let rootFolder = rootFolder, path = rootFolder.relativePath {
            logLine = path
        } else {
            logLine = ""
        }
        logger.log(logLine)
    }
    
    // MARK: Public
    
    func numberOfSectionsInTableView() -> Int {
        return 1
    }
    
    func tableView(numberOfRowsInSection section: Int) -> Int {
        guard let folderContent = folderContent else {
            return 0
        }
        return folderContent.count
    }
    
}