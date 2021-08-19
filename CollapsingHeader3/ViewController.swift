//
//  ViewController.swift
//  CollapsingHeader
//
//  Created by 신소민 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTop: NSLayoutConstraint!
    
    private let maxHeaderHeight: CGFloat = 250
    private let minHeaderHeight: CGFloat = 100
    private var previousScrollOffset: CGFloat = -CGFloat.leastNormalMagnitude
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set scrollView
        scrollViewTop.constant = minHeaderHeight
        scrollView.contentInset.top = maxHeaderHeight - minHeaderHeight
        
        scrollView.delegate = self
        scrollView.layer.cornerRadius = 20
        scrollView.clipsToBounds = true
        
        // set headerview
        headerHeight.constant = maxHeaderHeight + 50
        
        // set header (collapse)
        headerTitle.alpha = 0
        
        // set scrollView container
        container.layer.cornerRadius = 20
        container.clipsToBounds = true
    }

}

// MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentInsetTop = scrollView.contentInset.top
        if -contentInsetTop...0.0 ~= scrollView.contentOffset.y {
            
            let ratio = 1 - (abs(scrollView.contentOffset.y) / minHeaderHeight)
            headerTitle.alpha = ratio
       
        }
    }
    
}
