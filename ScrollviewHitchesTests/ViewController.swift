//
//  ViewController.swift
//  ScrollviewHitchesTests
//
//  Created by Yoshihisa Masaki on 2021/08/28.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1000
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        
        // simulate extremely slow cell content configuration and sluggish scroll
        Thread.sleep(forTimeInterval: 0.05)
        
        cell.contentView.backgroundColor = .random
        
        return cell
    }
}

extension UIColor {
    
    static var random: UIColor {
        UIColor(red: .random(in: .zero..<1.0), green: .random(in: .zero..<1.0), blue: .random(in: .zero..<1.0), alpha: 1.0)
    }
}
