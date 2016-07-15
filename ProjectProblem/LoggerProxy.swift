//
//  LoggerProxy.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class LoggerProxy {
    
    let fileHandler: NSFileHandle!
    let operationQueue = NSOperationQueue()
    
    init() {
        operationQueue.name = "File Logger"
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.qualityOfService = .Background

        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        let appFile = documentsDirectory.stringByAppendingString("/fileLog")
        let fm = NSFileManager.defaultManager()
        if fm.fileExistsAtPath(appFile) {
            fileHandler = NSFileHandle(forUpdatingAtPath: appFile)
        } else {
            fm.createFileAtPath(appFile, contents: nil, attributes: nil)
            fileHandler = NSFileHandle(forUpdatingAtPath: appFile)
        }
        fileHandler.seekToEndOfFile()
    }
    
    deinit {
        fileHandler.closeFile()
    }
    
}

extension LoggerProxy: ILoggerProxy {
 
    func log(line: String) {
        operationQueue.addOperationWithBlock {
            self.fileHandler.writeData((line + "\n\n").dataUsingEncoding(NSUTF8StringEncoding)!)
            self.fileHandler.synchronizeFile()
        }
    }
    
}