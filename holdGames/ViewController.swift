//
//  ViewController.swift
//  holdGames
//
//  Created by daylonvanwel on 09-02-15.
//  Copyright (c) 2015 daylon wel. All rights reserved.
//

import UIKit

class brandCell: UICollectionViewCell {
    
    
    @IBOutlet var brandCell: UIImageView!
    
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView: UICollectionView!
    
    var brands: NSMutableArray!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // nsmutable array to add object created with data from parse.com
        brands = NSMutableArray()
        
        self.navigationItem.title = "Brands"
        
        // create a query to get objects from parse.com
        let brandQuery = PFQuery(className: "Brands")
        
        // retrieve objects with block
        brandQuery.findObjectsInBackgroundWithBlock { (objects: [AnyObject]!, error: NSError!) -> Void in
            
            // loop through array "objects" retreived from parse
            for object in objects {
                
                // create Brand object for echt object (data) retreived from parse.com
                var brand = Brand()
                brand.name = object.valueForKey("brandName") as NSString
                brand.phoneNumber = object.valueForKey("brandPhoneNumber") as NSNumber
                brand.url = object.valueForKey("website") as NSString?
                brand.waiTingTime = object.valueForKey("waitingTime") as NSNumber?
               
                // get the data from the image file from parse
                var brandImageFile = object.valueForKey("brandImage") as PFFile
                brandImageFile.getDataInBackgroundWithBlock({ (imageData : NSData!, error: NSError!) -> Void in
                    var image = UIImage(data: imageData)
                    brand.image = image
                    
                    // add Brand object to mutable array
                    self.brands.addObject(brand)
                    
                    // reload collectionview after each object added
                    self.collectionView.reloadData()
                })
                
                
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        return brands.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
      
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("brandCell", forIndexPath: indexPath) as brandCell
        
        let currentBrand = brands.objectAtIndex(indexPath.row) as Brand
        
        cell.brandCell.image = currentBrand.image
        
        return cell
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        let size  = CGSizeMake(self.view.frame.size.width / 3, self.view.frame.size.width / 3)
        
        return size
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      
        // set the indexpath from sender ( collectionview cell selected)
        let indexPath = collectionView.indexPathForCell(sender as brandCell)

        if (segue.identifier == "showBandInfoSegue") {
            
            // create instanse of viewController
            var infoViewController = segue.destinationViewController as brandsInformationTableTableViewController
            
            // set property of "currentbrand" of viewcontroller
             infoViewController.currentBrand = brands.objectAtIndex(indexPath!.row) as Brand
        }
        
        
    }

}



class Brand {
    
    var image : UIImage!
    var name : NSString!
    var phoneNumber : NSNumber!
    var url : NSString!
    var waiTingTime : NSNumber!
}