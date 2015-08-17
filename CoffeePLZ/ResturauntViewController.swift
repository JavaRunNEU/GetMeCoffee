//
//  ResturauntViewController.swift
//  CoffeePLZ
//
//  Created by alex fallah on 8/16/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit
import SwiftyJSON

class ResturauntViewController: UITableViewController {





    override func viewDidLoad() {
        super.viewDidLoad()
        parseMenu()
        self.tableView.registerNib(UINib(nibName: "AFRViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        println(self.json["results"])



    }


    var json: JSON = JSON.nullJSON


    //MARK: Parsing menu
    func parseMenu() {
        if let file = NSBundle(forClass:AppDelegate.self).pathForResource("kimonoData", ofType: "json") {
            let data = NSData(contentsOfFile: file)!
            self.json = JSON(data:data)
            println(self.json["results"]["collection1"][0]["property2"][1]["href"])
        } else {
            //do something with error checking
        }

    }




    // MARK: - Table view data source

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 180.0
    }

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.section)
    }



    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.section)
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return self.json["results"]["collection1"].count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //do funky stuff with font
        let header = self.json["results"]["collection1"][section]["property2"][1]["text"].string
        return header
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {



        //        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell

        let shiz:AFRViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! AFRViewCell

        //        cell.textLabel?.text = "POOP"

        return shiz
    }



    func didSelectItemFromCollectionView(notification: NSNotification) {
        //        var cellData: Dictionary = notification.object as! Dictionary
        //
        //        if cellData
        //        {
        ////
        //        }

    }

    //    #pragma mark - NSNotification to select table cell
    //
    //    - (void) didSelectItemFromCollectionView:(NSNotification *)notification
    //    {
    //    NSDictionary *cellData = [notification object];
    //    if (cellData)
    //    {
    //    if (!self.detailViewController)
    //    {
    //    self.detailViewController = [[ORGDetailViewController alloc] initWithNibName:@"ORGDetailViewController" bundle:nil];
    //    }
    //    self.detailViewController.detailItem = cellData;
    //    [self.navigationController pushViewController:self.detailViewController animated:YES];



    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
