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
        
        let url = MemeAPI.EndPoint.randomMeme.url
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                return
            }
            
            let decoder = JSONDecoder()
            let memeResponse = try! decoder.decode(Meme.self, from: data)
        
            guard let memeUrl = URL(string: memeResponse.image) else{
                return
            }
            
            let task = URLSession.shared.dataTask(with: memeUrl, completionHandler: { (data, response, error) in
                guard let data = data else{
                    return
                }
                
                DispatchQueue.main.async {
                    self.imageView.image = UIImage(data: data)
                }
            })
            task.resume()
            
        }
        task.resume()
    }

    
    
}

