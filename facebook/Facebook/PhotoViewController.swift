//
//  PhotoViewController.swift
//  Facebook
//
//  Created by Kathryn Hastings on 10/23/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var donePanel: UIView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var photoActionsView: UIImageView!
    
    var image: UIImage!
    var selectedImageView: UIImageView!
    var lightboxTransition: LightboxTransition!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = image
        
        scrollView.contentSize = CGSize(width: 320, height: 600)
        scrollView.delegate = self
        self.view.backgroundColor = UIColor(white: 0, alpha: 1)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didPressDone(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        self.view.backgroundColor = UIColor(white: 0, alpha: 0)
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        donePanel.isHidden = true
        photoActionsView.isHidden = true
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let scrollY = scrollView.contentOffset.y
        
        if scrollY > 100 {
            dismiss(animated: true, completion: nil)
        } else {
            self.view.backgroundColor = UIColor(white: 0, alpha: 1)
            donePanel.isHidden = false
            photoActionsView.isHidden = false
        }
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let photoViewController = segue.destination as! PhotoViewController
        
        photoViewController.image = selectedImageView.image
        
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.custom
        lightboxTransition = LightboxTransition()
        photoViewController.transitioningDelegate = lightboxTransition
        lightboxTransition.duration = 00.3
    }


}
