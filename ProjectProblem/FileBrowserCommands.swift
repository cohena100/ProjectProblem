//
//  FileBrowserCommands.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class FileBrowserCommands {
    
    let fileSystemProxy: IFileSystemProxy

    init(fileSystemProxy: IFileSystemProxy) {
        self.fileSystemProxy = fileSystemProxy
    }
}

extension FileBrowserCommands: IFileBrowserCommands {
    
    func folderContent(rootFolder: NSURL?) -> [FileUI]? {
        guard let folderContent = fileSystemProxy.folderContent(rootFolder) else {
            return nil
        }
        return folderContent.map { FileUI(file: $0) }
    }
    
}