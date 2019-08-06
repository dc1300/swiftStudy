//
//  day20CollectionViewAnimationVC.swift
//  swift1
//
//  Created by 戴晨 on 2019/8/6.
//  Copyright © 2019 戴晨. All rights reserved.
//

import UIKit

class day20CollectionViewAnimationVC: UIViewController{
    private struct Constants {
        static let AnimationDuration: Double = 0.5
        static let AnimationDelay: Double = 0.0
        static let AnimationSpringDamping: CGFloat = 1.0
        static let AnimationInitialSpringVelocity: CGFloat = 1.0
    }
    
    lazy var collectionView: UICollectionView = {
        let  layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: __kScreenWidth__, height: 207)
        let collectionView = UICollectionView.init(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self 
        collectionView.backgroundColor = UIColor.clear
        
        collectionView.register(AnimationCollectionViewCell.self, forCellWithReuseIdentifier: "testCollectionViewCell")
        return collectionView
    }()
    
    var imageCollection: AnimationImageCollection!
    override func viewDidLoad() {
        super.viewDidLoad()

        imageCollection = AnimationImageCollection()
        self.view.addSubview(self.collectionView)
        self.collectionView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.collectionView.reloadData()
    }

    // MARK: 私有方法
    private func handleAnimationCellSelected(_ collectionView: UICollectionView, cell: AnimationCollectionViewCell) {
        cell.handleCellSelected()
        cell.backButtonTapped = self.backButtonDidTouch
        let animations = {
            cell.frame = self.view.bounds
        }
        
        let completion: (_ finished: Bool) -> () = { _ in
            collectionView.isScrollEnabled = false
        }
        
        UIView.animate(withDuration: Constants.AnimationDuration,
                    delay: Constants.AnimationDelay,
                    usingSpringWithDamping:Constants.AnimationSpringDamping,
                    initialSpringVelocity: Constants.AnimationInitialSpringVelocity,
                    options: [],
                    animations: animations,
                    completion: completion)
    }
    
    // MARK: 按钮事件
    func backButtonDidTouch() {
        guard let indexPaths = self.collectionView.indexPathsForSelectedItems else {
            return
        }
        
        collectionView.isScrollEnabled = true
        collectionView.reloadItems(at: indexPaths)
    }

    
   
}
extension day20CollectionViewAnimationVC :UICollectionViewDelegate,UICollectionViewDataSource{
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageCollection.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testCollectionViewCell", for: indexPath) as? AnimationCollectionViewCell,
            let viewModel = imageCollection.images.safeIndex(indexPath.item) else {
                return UICollectionViewCell()
        }
        cell.prepareCell(viewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? AnimationCollectionViewCell else {
            return
        }
        self.handleAnimationCellSelected(collectionView, cell: cell)
    }
}

extension Array {
    func safeIndex(_ i: Int) -> Element? {
        return i < self.count && i >= 0 ? self[i] : nil
    }
}
