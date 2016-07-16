//
//  FileBrowserCommandsTest.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 15/7/16.
//
//

import XCTest

class FileBrowserCommandsTest: XCTestCase {

    var loggerProxy: LoggerProxyMock!
    var fileSystemProxy: FileSystemProxyMock!
    var commands: FileBrowserCommands!
    
    override func setUp() {
        super.setUp()
        loggerProxy = LoggerProxyMock()
        fileSystemProxy = FileSystemProxyMock()
        commands = FileBrowserCommands(fileSystemProxy: fileSystemProxy, loggerProxy: loggerProxy)
    }
    
    override func tearDown() {
        commands = nil
        fileSystemProxy = nil
        loggerProxy = nil
        super.tearDown()
    }

    func testFolderContent_rootFolder_5Files() {
        let folderContent = commands.folderContent(nil)
        XCTAssert(folderContent?.count == 5)
        XCTAssertEqual(loggerProxy.lines.count, 1)
    }

    func testFolderContent_folderNamedA_6Files() {
        let url = NSURL(fileURLWithPath: "a")
        let folderContent = commands.folderContent(url)
        XCTAssert(folderContent?.count == 6)
    }
    
    func testFolderContent_nonExistingFolder_Nil() {
        let url = NSURL(fileURLWithPath: "nonExistingFolder")
        let folderContent = commands.folderContent(url)
        XCTAssertNil(folderContent)
    }
    
}
