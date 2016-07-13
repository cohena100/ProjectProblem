//
//  MainMediator.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

protocol MainMediatorDelegate: class {
    func mainMediatorDelegateReloadData()
}

class MainMediator {
    
    weak var delegate: MainMediatorDelegate?
    var rootFolder: NSURL?
    let fileBrowserCommands: IFileBrowserCommands
    var folderContent: [FileUI]?
    
    init(delegate: MainMediatorDelegate?, fileBrowserCommands: IFileBrowserCommands) {
        self.delegate = delegate
        self.fileBrowserCommands = fileBrowserCommands
        dispatch_async(dispatch_get_main_queue()) {
            self.setup()
            self.delegate?.mainMediatorDelegateReloadData()
        }
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
    
    // MARK: Setup
    
    func setup() {
        folderContent = fileBrowserCommands.folderContent(rootFolder)
    }
    
}