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
    
    weak var delegate: MainMediatorDelegate?
    var rootFolder: NSURL?
    let fileBrowserCommands: IFileBrowserCommands
    var folderContent: [FileUI]?
    
    init(delegate: MainMediatorDelegate?, rootFolder: NSURL?, fileBrowserCommands: IFileBrowserCommands) {
        self.delegate = delegate
        self.fileBrowserCommands = fileBrowserCommands
        self.rootFolder = rootFolder
        folderContent = fileBrowserCommands.folderContent(rootFolder)
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