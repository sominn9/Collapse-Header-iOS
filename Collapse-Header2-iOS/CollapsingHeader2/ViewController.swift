//
//  ViewController.swift
//  CollapsingHeader
//
//  Created by 신소민 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var scrollViewTop: NSLayoutConstraint!
    
    private let maxHeaderHeight: CGFloat = 250
    private let minHeaderHeight: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set scrollView
        scrollViewTop.constant = minHeaderHeight
        scrollView.contentInset.top = maxHeaderHeight - minHeaderHeight
        
        // set headerview height
        headerHeight.constant = maxHeaderHeight
    }

}
