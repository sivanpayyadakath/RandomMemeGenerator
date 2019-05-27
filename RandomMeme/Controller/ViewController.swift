//
//  ViewController.swift
//  RandomMeme
//
//  Created by Sivan.Payyadakath on 2019/05/23.
//  Copyright © 2019 Sivan.Payyadakath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Random Meme"
        // Do any additional setup after loading the view.
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(nextMeme))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        MemeAPI.requestRandomMeme(completionHandler: self.handleFileResponse(memeResponse:error:))
        
    }
    
    func handleFileResponse(memeResponse: Meme?, error: Error?){
        guard let memeUrl = URL(string: memeResponse?.image ?? "") else{
            return
        }
        
        MemeAPI.memeResponseInView(memeUrl: memeUrl, completionHandler: self.handleImageResponse(downloadedMeme:error:))
    }
    
    func handleImageResponse(downloadedMeme: UIImage?, error: Error?){
        DispatchQueue.main.async {
            self.imageView.image = downloadedMeme
        }
    }
    

    @objc private func nextMeme() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            MemeAPI.requestRandomMeme(completionHandler: self.handleFileResponse(memeResponse:error:))
            
        }, completion: nil)
    }
    
    private func newMeme(){

    }
    
}

