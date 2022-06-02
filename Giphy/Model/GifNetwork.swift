//
//  GifNetwork.swift
//  Giphy
//
//  Created by FIRDOUS UR RASOOL on 01/06/22.
//

import Foundation
class GifNetwork{
    var apiKey = "JUlO9jFSVO10CxyPpNRMiB6V24WgaPI0"
    //MARK: the methods requests the api for data and gets the data - and it loads the searched gifs whenever the search bar takes a input text 
    func fetchGifs(searchTerm:String, completion: @escaping (_ response: GifArray?) -> Void){
        //create Url Request
        let url = URL(string: "https://api.giphy.com/v1/gifs/search?&downsized_small=mp4_size&api_key=\(apiKey)&q=\(searchTerm)")!
        var request = URLRequest(url: url)
        //get Method
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                            print("Error fetching from Giphy: ", error.localizedDescription)
                            }
            do {
                // Decode the data into array of Gifs
                DispatchQueue.main.async {
                let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                completion(object)
                }
            }
        }.resume()
    }
    //MARK: _ The mathod that fetches the trnding Gifs
    func fetchTrendingGifs(_ completion: @escaping (_ response: GifArray?) -> Void){
        //create Url Request
        let trendingUrl = URL(string: "https://api.giphy.com/v1/gifs/trending?api_key=nwgbq8vEVHOITxuA7VeoXYwGVgiwuWQv&rating=g&downsized_small=mp4_size")!
        var request = URLRequest(url: trendingUrl)
        //it requests to get the data
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print("Error fetching trending Giphs: ", error.localizedDescription)
            }
            do{
                //Decode the data into an array
                DispatchQueue.main.async{
                    let object = try! JSONDecoder().decode(GifArray.self, from: data!)
                    completion(object)
                }
            }
        }.resume()
    }
}
