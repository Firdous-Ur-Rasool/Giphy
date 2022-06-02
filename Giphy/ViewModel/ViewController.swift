//
//  ViewController.swift
//  Giphy
//
//  Created by FIRDOUS UR RASOOL on 01/06/22.
//

import UIKit
import SDWebImage
class ViewController: UIViewController {
    var network = GifNetwork()
    var gifs = [Gif]()
    var gif:Gif?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        showtrendingGifs()
        searchBar.searchTextField.delegate = self
        searchBar.searchTextField.placeholder = "Search for Fav Gif's"
       
    }
    //MARK: the method is used to search the favorite gifs
    func searchGifs(for searchText: String) {
            network.fetchGifs(searchTerm: searchText) { gifArray in
                if gifArray != nil {
                    //print(gifArray!.gifs)
                    self.gifs = gifArray!.gifs
                    self.collectionView.reloadData()
                }
            }
        }
    //MARK: - the methods is used to show the trending gifs
    func showtrendingGifs(){
        network.fetchTrendingGifs(){gifArray in
            if gifArray != nil{
                self.gifs = gifArray!.gifs
                self.collectionView.reloadData()
            }
        }
    }

}
//MARK: - Extension of Collection View to View Controller
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return gifs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionCell
        cell.gif = gifs[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.size.width-30)/3
        return CGSize(width:size, height: 200)
    }
    
}
//MARK: It detects the input text inside the textfeild
extension ViewController:UISearchTextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.text != nil{
            searchGifs(for: textField.text!)
        }
        return true
    }
}

