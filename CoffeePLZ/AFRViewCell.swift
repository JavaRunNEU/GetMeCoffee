//
//  AFRViewCell.swift
//  CoffeePLZ
//
//  Created by alex fallah on 8/16/15.
//  Copyright (c) 2015 alex fallah. All rights reserved.
//

import UIKit

class AFRViewCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource {

  
    @IBOutlet weak var collectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()



        self.collectionView.backgroundView?.backgroundColor = UIColor(red: 204.0/255.0, green: 204.0/255.0, blue: 204.0/255.0, alpha: 1.0)


        var flowLayout =  UICollectionViewFlowLayout()

        flowLayout.scrollDirection = UICollectionViewScrollDirection.Horizontal
        flowLayout.itemSize = CGSizeMake(130.0, 170.0)
        self.collectionView.setCollectionViewLayout(flowLayout, animated: true)


        self.collectionView.registerNib(UINib(nibName: "AFMenuCell", bundle: nil), forCellWithReuseIdentifier: "AFMenuCell")


    }


    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //    ORGArticleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ORGArticleCollectionViewCell" forIndexPath:indexPath];
        //    NSDictionary *cellData = [self.collectionData objectAtIndex:[indexPath row]];
        //    cell.articleTitle.text = [cellData objectForKey:@"title"];
        //    return cell;        return

        var cell: AFMenuCell = collectionView.dequeueReusableCellWithReuseIdentifier("AFMenuCell", forIndexPath: indexPath) as! AFMenuCell

        return cell

    }


    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println(indexPath.row)
        }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

//    #pragma mark - Getter/Setter overrides
//    - (void)setCollectionData:(NSArray *)collectionData {
//    _collectionData = collectionData;
//    [_collectionView setContentOffset:CGPointZero animated:NO];
//    [_collectionView reloadData];
//    }
//
//

//    - (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return [self.collectionData count];
//    }
//
//    - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//    {
//    ORGArticleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ORGArticleCollectionViewCell" forIndexPath:indexPath];
//    NSDictionary *cellData = [self.collectionData objectAtIndex:[indexPath row]];
//    cell.articleTitle.text = [cellData objectForKey:@"title"];
//    return cell;
//    }
//
//    - (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
//    NSDictionary *cellData = [self.collectionData objectAtIndex:[indexPath row]];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"didSelectItemFromCollectionView" object:cellData];
//    }
//    

    
}
