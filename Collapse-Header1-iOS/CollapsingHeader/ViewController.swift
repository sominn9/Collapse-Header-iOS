//
//  ViewController.swift
//  CollapsingHeader
//
//  Created by 신소민 on 2021/08/14.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    
    private let maxHeaderHeight: CGFloat = 250
    private let minHeaderHeight: CGFloat = 80
    private var previousScrollOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomCell.self, forCellReuseIdentifier: "ReuseCell")
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReuseCell", for: indexPath) as! CustomCell
        cell.label.text = String(indexPath.row)
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let scrollDiff = (scrollView.contentOffset.y - previousScrollOffset)
        let isScrollingDown = scrollDiff > 0
        let isScrollingUp = scrollDiff < 0
        
        var newHeight: CGFloat = 0
        
        if canAnimateHeader(scrollView) {
            if isScrollingDown {
                newHeight = max(minHeaderHeight, headerHeight.constant - abs(scrollDiff))
            } else if isScrollingUp {
                newHeight = min(maxHeaderHeight, headerHeight.constant + abs(scrollDiff))
            }
            
            if newHeight != headerHeight.constant {
                headerHeight.constant = newHeight
                previousScrollOffset = scrollView.contentOffset.y
            }
        }
    }
    
    func canAnimateHeader (_ scrollView: UIScrollView) -> Bool {
        let scrollViewMaxHeight = UIScreen.main.bounds.height - self.minHeaderHeight
        return scrollView.contentSize.height > scrollViewMaxHeight
    }
    
}
