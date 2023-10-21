//
//  Feed.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 21/10/23.
//

import Foundation

struct Feed: Codable {
    let data: [Content]
}

struct Content: Codable {
   
    let description: String
    let title: String
    let contents: [SubContent]
}

struct SubContent: Codable {
    let assets: [Asset]
    let contentType: String
    let description: String
}

struct Asset: Codable {
    let assetType: String
    let sourceUrl: String
    let type: String
    let sourcePath: String
}
