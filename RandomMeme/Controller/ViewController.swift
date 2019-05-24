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
    @IBOutlet var swipeGesture: UISwipeGestureRecognizer!
    @IBOutlet weak var button: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Random Meme"
        // Do any additional setup after loading the view.
        
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
    

}

