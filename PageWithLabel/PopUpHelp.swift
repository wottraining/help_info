//
//  ViewController.swift
//  PageWithLabel
//
//  Created by WHITEOPEN on 27/11/18.
//  Copyright © 2018 PT. WhiteOpen Technology. All rights reserved.
//

import UIKit

class PopUpHelp: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var prevBtn: UIButton!
    @IBOutlet weak var coverPopUp: UIView!
    
    
    var slides:[Slide] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coverPopUp.layer.cornerRadius = 4
        
        scrollView.delegate = self
        
        slides = setSlide()
        pageControl.numberOfPages = slides.count
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupScrollView(slides: slides)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(pageNumber)
    }
    
    func setSlide() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.imgView.image = UIImage(named: "4")
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.imgView.image = UIImage(named: "account_bank")
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.imgView.image = UIImage(named: "4")
        
        let slide4:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide4.imgView.image = UIImage(named: "account_bank")
        
        return [slide1, slide2, slide3, slide4]
    }
    
    func setupScrollView(slides:[Slide]){
        
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(slides.count), height: scrollView.frame.height)
        
        //old method (for full screen)
        /*scrollView.frame = CGRect(x: 0, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
        scrollView.contentSize = CGSize(width: scrollView.frame.width * CGFloat(slides.count), height: scrollView.frame.height)*/
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: scrollView.frame.width * CGFloat(i), y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            
            //old method (for full screen)
//            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
    func nextPrevBtnAction(page:Int) {
        //letak tampilan page
        let x = CGFloat(page) * scrollView.frame.width
        //ganti page
        scrollView.contentOffset = CGPoint(x: x, y: 0)
        //ganti page control
        pageControl.currentPage = Int(page)
        
        print("button index : \(page) * \(scrollView.frame.width)")
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextBtnPressed(_ sender: Any) {
    
        let nextPage = pageControl.currentPage + 1
        if nextPage < pageControl.numberOfPages {
            nextPrevBtnAction(page: nextPage)
        }
    }
    
    @IBAction func prevBtnPressed(_ sender: Any) {
        let prevPage = pageControl.currentPage - 1
        if prevPage >= 0{
            nextPrevBtnAction(page: prevPage)
        }
    }
    
    @IBAction func pageControlPressed(_ sender: UIPageControl) {
        let x = CGFloat(sender.currentPage) * scrollView.frame.width
        scrollView.contentOffset = CGPoint(x: x, y: 0)
        print("button index : \(CGFloat(sender.currentPage)) * \(scrollView.frame.width) = \(x)")
    }
}

