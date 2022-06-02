//
//  GifModel.swift
//  Giphy
//
//  Created by FIRDOUS UR RASOOL on 01/06/22.
//

import Foundation
// Array of Gif objects.
struct GifArray: Decodable {
    var gifs: [Gif]
    enum CodingKeys: String, CodingKey {
        case gifs = "data"
    }
}
// Contains giph properties
struct Gif: Decodable {
    var gifSources: GifImages
    
    enum CodingKeys: String, CodingKey {
        case gifSources = "images"
        
    }
    // Returns download url of the originial gif
    func getGifURL() -> String{
        return gifSources.original.url
    }
    
}
// Stores the original Gif
struct GifImages: Decodable {
    var original: original
    var downsized_small: downsized_small
    enum CodingKeys: String, CodingKey {
        case original = "original"
        case downsized_small = "downsized_small"
    }
    
}
// URL to data of Gif
struct original: Decodable {
    var url: String
    
}
struct downsized_small: Decodable{
    var mp4_size:String
}
//data[0].images.downsized_small.mp4_size
