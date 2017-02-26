//
//  CollectionViewController.swift
//  PaintStudio
//
//  Created by u0844210 on 2/25/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDataSource {
    
    
    private var collectionView: UICollectionView {
        return view as! UICollectionView
    }
    var paintingCollection: PaintingCollection = PaintingCollection()
    
    override func loadView() {
        view = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(StudioView.self, forCellWithReuseIdentifier: "Painting")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PaintingView = collectionView.dequeueReusableCell(withReuseIdentifier: "Painting", for: indexPath) as! PaintingView
        return cell
    }
    
}
