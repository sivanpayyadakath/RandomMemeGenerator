//
//  MemeAPI.swift
//  RandomMeme
//
//  Created by Sivan.Payyadakath on 2019/05/23.
//  Copyright © 2019 Sivan.Payyadakath. All rights reserved.
//

import Foundation

class MemeAPI{
    enum EndPoint : String{
        case randomMeme = "https://api.memeload.us/v1/random"
        
        var url: URL{
            return URL(string: self.rawValue)!
        }
    }
    
}
