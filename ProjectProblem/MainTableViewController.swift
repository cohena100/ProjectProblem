//
//  MainTableViewController.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var fileBrowserCommands: IFileBrowserCommands!
    weak var logger: ILoggerProxy!
    var rootFolder: NSURL?
    var folderContent: [FileUI]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = rootFolder == nil ? "Root" : rootFolder?.lastPathComponent
        let setupElements = Model.sharedInstance.factory.setupElementsForMainTableViewController()
        self.logger = setupElements.loggerProxy
        self.fileBrowserCommands = setupElements.fileBrowserCommands
        folderContent = fileBrowserCommands.folderContent(rootFolder)
        let logLine: String
        if let rootFolder = rootFolder, path = rootFolder.relativePath {
            logLine = path
        } else {
            logLine = ""
        }
        logger.log(logLine)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let folderContent = folderContent else {
            return 0
        }
        return folderContent.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let folderContent = folderContent else {
            abort()
        }
        let file = folderContent[indexPath.row]
        let cell: UITableViewCell
        if file.isFolder {
            cell = tableView.dequeueReusableCellWithIdentifier("FolderCell", forIndexPath: indexPath)
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier("FileCell", forIndexPath: indexPath)
        }
        cell.textLabel?.text = file.name
        cell.textLabel?.textColor = file.color
        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let vc = segue.destinationViewController as? MainTableViewController, indexPath = tableView.indexPathForSelectedRow, folderContent = folderContent else {
            abort()
        }
        let file = folderContent[indexPath.row]
        vc.rootFolder = file.path
    }
    
}
