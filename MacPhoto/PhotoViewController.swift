//
//  PhotoViewController.swift
//  MacPhoto
//
//  Created by Christopher Boynton on 3/23/17.
//  Copyright © 2017 Christopher Boynton. All rights reserved.
//

import Cocoa

class PhotoViewController: NSViewController {
    
    @IBOutlet weak var photoCollectionView: NSCollectionView!
    @IBOutlet weak var photoCollectionViewLayout: NSCollectionViewFlowLayout!
    @IBOutlet weak var photoListView: NSView!
    
    init() {
        super.init(nibName: "PhotoViewController", bundle: nil)!
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var pathControlClickHandler: NSClickGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        LocalFileManager.instance.loadPhotoInfo {
            self.photoCollectionView.reloadData()
        }
        configureCollectionView()
        configurePhotoListView()

    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
        
    }
    
    private func configureCollectionView() {
        photoCollectionViewLayout.itemSize = NSSize(width: 160, height: 140)
        photoCollectionViewLayout.sectionInset = NSEdgeInsetsMake(10, 10, 10, 10)
        photoCollectionViewLayout.minimumLineSpacing = 0
        photoCollectionViewLayout.minimumInteritemSpacing = 0
        photoCollectionView.collectionViewLayout = photoCollectionViewLayout
        
        photoCollectionView.wantsLayer = true
        
        photoCollectionView.layer = CALayer()
        photoCollectionView.layer?.backgroundColor = NSColor.black.cgColor
        
    }
    
    private func configurePhotoListView() {
        let layer = CALayer()
        
        layer.backgroundColor = NSColor(calibratedRed: 144/255, green: 0/255, blue: 31/255, alpha: 1).cgColor
        
        photoListView.layer = layer
    }
    
}

extension PhotoViewController: NSCollectionViewDataSource {
    
    func numberOfSections(in collectionView: NSCollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataStore.instance.photos.count
    }
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        let item = collectionView.makeItem(withIdentifier: "PhotoCollectionViewItem", for: indexPath)
        guard let collectionViewItem = item as? PhotoCollectionViewItem else { return item }
        
        let photo = DataStore.instance.photos.at(index: indexPath.item)
        collectionViewItem.load(photo: photo, index: indexPath.item)
        return collectionViewItem
    }
}

extension PhotoViewController: NSCollectionViewDelegate {
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
    }
    
}

