//
//  ViewController.swift
//  Nasa
//
//  Created by Чистяков Василий Александрович on 07.09.2021.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    let jsonNasa = "https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY"
 
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingManager.shared.fetchData(url: jsonNasa) { model in
            self.fetchImage(url: model.hdurl)
        }
    }
    
    func fetchImage(url: String) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                   self.imageView.image = image
                   UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
                }
            }
        }.resume()
    }
}

