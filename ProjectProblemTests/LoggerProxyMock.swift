//
//  LoggerProxyMock.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import Foundation

class LoggerProxyMock {
    
    var lines = [String]()
    
}

extension LoggerProxyMock: ILoggerProxy {
    
    func log(line: String) {
        lines.append(line)
    }
    
}