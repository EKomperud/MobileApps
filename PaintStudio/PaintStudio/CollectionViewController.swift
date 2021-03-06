//
//  CollectionViewController.swift
//  PaintStudio
//
//  Created by u0844210 on 2/25/17.
//  Copyright © 2017 cs4530. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController, StudioControllerDelegate {
    
    var studioController = StudioViewController()
    
    var paintingCollection = PaintingCollection()
    
    var collectionView: UICollectionView! // = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    override func loadView() {

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Painting Collection"
        studioController.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
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
    
    // StudioControllerDelegate
    func PassOffToCollection(deleted: Bool, i: Int) {
        if deleted {
            paintingCollection.RemovePainting(index: i)
            for p in i...paintingCollection.count - 1 {
                paintingCollection.collection[p].index -= 1
            }
        }
        navigationController?.popViewController(animated: true)
        collectionView.reloadData()
    }
    
    // StudioControllerDelegate
    func Created(studio: StudioView, withCanvas painting: Painting) {
        let index: Int = paintingCollection.count
        paintingCollection.AddPainting(p: painting)
        paintingCollection.collection[index].index = index
        studioController.studioView = studio
        studioController.studioView.index = index
    }
    
    func Painted(studio: StudioView, stroke: Stroke) {
        paintingCollection.collection[studio.index].AddStroke(stroke: stroke)
    }
    
    func SendAspect(i: Int, x: CGFloat, y: CGFloat) {
        paintingCollection.collection[i].aspectX = x
        paintingCollection.collection[i].aspectY = y
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let paintingCell = cell as! PaintingPreview
        paintingCell.Load(Painting: paintingCollection.collection[indexPath.item])
        cell.setNeedsDisplay()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: paintingCollection.collection[indexPath[1]].aspectX / 5, height: paintingCollection.collection[indexPath[1]].aspectY / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
        if indexPath[1] == paintingCollection.count - 1 {
            paintingCollection.AddPainting(p: Painting(AspectX: 100, AspectY: 200))
            paintingCollection.collection.last?.index = paintingCollection.count - 1
            studioController.studioView.paintingView._aspectSent = false
        }
        studioController.studioView.paintingView.painting = paintingCollection.collection[indexPath[1]]
        let newStroke = studioController.studioView.paintingView.stroke
        studioController.studioView.paintingView.stroke = Stroke(W: newStroke.width, C: newStroke.color, Join: newStroke.lineJoin, Cap: newStroke.lineCap)
        studioController.studioView.paintingView.setNeedsDisplay()
        navigationController?.pushViewController(studioController, animated: true)
    }
    
}
