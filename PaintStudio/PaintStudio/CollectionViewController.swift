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
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PaintingView.self, forCellWithReuseIdentifier: "Painting")
        collectionView.backgroundColor = UIColor.lightGray
        if paintingCollection.count == 0 {
            paintingCollection.AddPainting(p: Painting(AspectX: 100, AspectY: 200))
        }
        view = collectionView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func SetupView() {

        view.addSubview(collectionView)
    }
    
}

extension CollectionViewController:  UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return paintingCollection.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PaintingView = collectionView.dequeueReusableCell(withReuseIdentifier: "Painting", for: indexPath) as! PaintingView
        cell.readOnly = true
        cell.backgroundColor = UIColor.white
        cell.setNeedsDisplay()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath[0] == paintingCollection.count {
            paintingCollection.AddPainting(p: Painting(AspectX: 100, AspectY: 200))
            paintingCollection.collection.last?.index = paintingCollection.count - 1
        }
        delegate?.PassOffToStudio(painting: paintingCollection.collection[indexPath[0]])
    }
    
}
