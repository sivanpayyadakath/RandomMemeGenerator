//
//  MemeAPI.swift
//  RandomMeme
//
//  Created by Sivan.Payyadakath on 2019/05/23.
//  Copyright © 2019 Sivan.Payyadakath. All rights reserved.
//

import Foundation
import UIKit

class MemeAPI{
    enum EndPoint : String{
        case randomMeme = "https://api.memeload.us/v1/random"
        
        var url: URL{
            return URL(string: self.rawValue)!
        }
    }
    
    class func memeResponseInView(memeUrl: URL, completionHandler: @escaping (UIImage?, Error?) -> Void){
        let task = URLSession.shared.dataTask(with: memeUrl, completionHandler: { (data, response, error) in
            guard let data = data else{
                completionHandler(nil, error)
                return
            }
            
            let downloadedMeme = UIImage(data: data)
            completionHandler(downloadedMeme, nil)
        })
        task.resume()
    }
    
    class func requestRandomMeme(completionHandler: @escaping (Meme?, Error?) -> Void){
        let url = MemeAPI.EndPoint.randomMeme.url
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else{
                completionHandler(nil, error)
                return
            }
            
            let decoder = JSONDecoder()
            let memeResponse = try! decoder.decode(Meme.self, from: data)
            completionHandler(memeResponse, nil)
        }
        task.resume()
    }
}
