//
//  MemeAPI.swift
//  RandomMeme
//
//  Created by Sivan.Payyadakath on 2019/05/23.
//  Copyright © 2019 Sivan.Payyadakath. All rights reserved.
//

import Foundation

struct Meme: Codable{
    let powered_by: String
    let id: Int
    let source: String
    let permalink: String
    let subreddit: String
    let title: String
    let author: String
    let date: String
    let image: String
    let hashtype: String
    let imagehash: String

}
