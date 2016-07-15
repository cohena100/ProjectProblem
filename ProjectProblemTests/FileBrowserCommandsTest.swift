//
//  FileBrowserCommandsTest.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 15/7/16.
//
//

import XCTest

class FileBrowserCommandsTest: XCTestCase {

    var commands: IFileBrowserCommands!
    
    override func setUp() {
        super.setUp()
        commands = FileBrowserCommands(fileSystemProxy: FileSystemProxyMock())
    }
    
    override func tearDown() {
        commands = nil
        super.tearDown()
    }

    func testFolderContent_rootFolder_5Files() {
        let folderContent = commands.folderContent(nil)
        XCTAssert(folderContent?.count == 5)
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
