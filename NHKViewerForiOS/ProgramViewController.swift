//
//  ProgramViewController.swift
//  NHKViewerForiOS
//
//  Created by fumiya.gemba on 2017/06/30.
//  Copyright © 2017年 fumiya.gemba. All rights reserved.
//

import UIKit
import RealmSwift

class ProgramViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var programs: Results<Program>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        programs = ProgramStore().all()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ProgramViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return programs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProgramCell", for: indexPath) as! ProgramCell
        
        cell.setData(program: programs[indexPath.row])
        return cell
    }
}

extension ProgramViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "ProgramDetailViewController", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! ProgramDetailViewController
        
        vc.setProgram(program: programs[indexPath.row])
        self.present(vc, animated: false, completion: nil)
    }
}

extension ProgramViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let height = CGFloat(80)
        return CGSize(width: width, height: height)
    }
}
