//
//  LoggerProxy.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class LoggerProxy {
    
}

extension LoggerProxy: ILoggerProxy {
 
    func log(line: String) {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
        let documentsDirectory = paths[0]
        let appFile = documentsDirectory.stringByAppendingString("/fileLog")
        var fileHandler: NSFileHandle! = NSFileHandle(forUpdatingAtPath: appFile)
        if fileHandler == nil {
            NSFileManager.defaultManager().createFileAtPath(appFile, contents: nil, attributes: nil)
            fileHandler = NSFileHandle(forUpdatingAtPath: appFile)
        }
        fileHandler.seekToEndOfFile()
        fileHandler.writeData((line + "\n\n").dataUsingEncoding(NSUTF8StringEncoding)!)
        fileHandler.closeFile()
    }
    
}