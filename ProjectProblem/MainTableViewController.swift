//
//  MainTableViewController.swift
//  ProjectProblem
//
//  Created by Avi Cohen on 13/7/16.
//
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var mediator: MainMediator!
    var rootFolder: NSURL?

    override func viewDidLoad() {
        super.viewDidLoad()
        mediator = Model.sharedInstance.factory.getMainMediator(delegate: self, rootFolder: rootFolder)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return mediator.numberOfSectionsInTableView()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediator.tableView(numberOfRowsInSection: section)
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let folderContent = mediator.folderContent else {
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
        guard let vc = segue.destinationViewController as? MainTableViewController, indexPath = tableView.indexPathForSelectedRow, folderContent = mediator.folderContent else {
            abort()
        }
        let file = folderContent[indexPath.row]
        vc.rootFolder = file.path
    }
    
}

extension MainTableViewController: MainMediatorDelegate {
    
}
