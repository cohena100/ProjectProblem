//
//  FileBrowserCommands.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class FileBrowserCommands {
    
    weak var fileSystemProxy: IFileSystemProxy!
    weak var loggerProxy: ILoggerProxy!

    init(fileSystemProxy: IFileSystemProxy, loggerProxy: ILoggerProxy) {
        self.fileSystemProxy = fileSystemProxy
        self.loggerProxy = loggerProxy
    }
}

extension FileBrowserCommands: IFileBrowserCommands {
    
    func folderContent(rootFolder: NSURL?) -> [FileUI]? {
        let line = rootFolder?.relativePath == nil ? "" : rootFolder!.relativePath!
        loggerProxy.log(line)
        guard let folderContent = fileSystemProxy.folderContent(rootFolder) else {
            return nil
        }
        return folderContent.map { FileUI(file: $0) }
    }
    
}