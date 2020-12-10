//
//  PageControlViewController.swift
//  ScrollViewDelegate
//
//  Created by binyu on 2020/12/9.
//

import UIKit

class PageControlViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changePage(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
                scrollView.setContentOffset(point, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    

}


extension PageControlViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.bounds.width
                pageControl.currentPage = Int(page)
            
        }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           for pageView in scrollView.subviews {
              if pageView.isKind(of: UIView.self){
                 return pageView
              }
           }
           return nil
        }
    
}
