//
//  CollectionViewController.swift
//  PaintStudio
//
//  Created by u0844210 on 2/25/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

protocol CollectionControllerDelegate: class {
    func PassOffToStudio(painting: Painting)
}

class CollectionViewController: UIViewController {
    
    var delegate: CollectionControllerDelegate? = nil
    
    var paintingCollection = PaintingCollection()
    
    var collectionView: UICollectionView! // = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func loadView() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 0
        collectionView = UICollectionView(frame: CGRect(x:0.0, y:(navigationController?.navigationBar.frame.height)!, width: (navigationController?.navigationBar.frame.width)!, height: 736 - (navigationController?.navigationBar.frame.height)!), collectionViewLayout: layout)
        //collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.allowsSelection = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PaintingPreview.self, forCellWithReuseIdentifier: "Painting")
        collectionView.backgroundColor = UIColor.lightGray
        if paintingCollection.count == 0 {
            paintingCollection.AddPainting(p: Painting(AspectX: 100, AspectY: 200))
        }
        view = collectionView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

extension CollectionViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paintingCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PaintingPreview = collectionView.dequeueReusableCell(withReuseIdentifier: "Painting", for: indexPath) as! PaintingPreview
        cell.backgroundColor = UIColor.white
        cell.setNeedsDisplay()
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        let paintingCell = cell as! PaintingPreview
//        //paintingCell.
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: paintingCollection.collection[indexPath.item].aspectX, height: paintingCollection.collection[indexPath.item].aspectY)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(view.frame.height)
        print(indexPath.item)
        print(indexPath.row)
        if indexPath[0] == paintingCollection.count {
            paintingCollection.AddPainting(p: Painting(AspectX: 100, AspectY: 200))
            paintingCollection.collection.last?.index = paintingCollection.count - 1
        }
        delegate?.PassOffToStudio(painting: paintingCollection.collection[indexPath[0]])
    }
    
}
